require 'sequel'

class TaskManager
  def initialize(db)
    @tasks = db
  end

  def add_task(task)
    incoming_task = task
    incoming_task[:completed] = false
    @tasks.insert(incoming_task)
  end

  def show_all
    @tasks.all
  end

  def find_task(id)
    @tasks.where(:id => id).to_a.first
  end

  def update_task(id, task)
    @tasks.where(:id => id).update(task)
  end

  def delete_task(id)
    @tasks.where(:id => id).delete
  end
end
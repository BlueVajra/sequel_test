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
    @tasks.where('id = ' + 1.to_s).to_a
  end

  def update_task(task)
    @tasks.where('id = ' + task[:id].to_s).update(task)
  end

  def delete_task(task)
    @tasks.where('id = ' + task[:id].to_s).delete
  end
end
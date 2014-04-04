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
    filter_by_id(id).to_a.first
  end

  def update_task(id, task)
    filter_by_id(id).update(task)
  end

  def delete_task(id)
    filter_by_id(id).delete
  end

  private
  def filter_by_id(id)
    @tasks.where(:id => id)
  end
end
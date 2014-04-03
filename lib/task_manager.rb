require 'sequel'

class TaskManager
  def initialize(db)
    @db = db
    @db.create_table! :tasks do
      primary_key :id
      Boolean :completed
      String :name
    end
    @tasks = @db[:tasks]
  end

  def add_task(task)
    incoming_task = task
    incoming_task[:completed] = false
    @tasks.insert(incoming_task)
  end

  def show_all
    @tasks.all
  end

  def update_task(task)
    @tasks.where('id = ' + task[:id].to_s).update(task)
  end

  def delete_task(task)
    @tasks.where('id = ' + task[:id].to_s).delete
  end
end
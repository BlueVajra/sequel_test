require 'sequel'

class TaskManager
  def initialize(db)
    @db = db
    @db.create_table! :tasks do
      primary_key :id
      String :name
    end

    @tasks = @db[:tasks]
  end

  def add_task(task)
    @tasks.insert(task)
  end

  def show_all
    @tasks.all
  end
end
require 'sequel'

class TaskManager
  def initialize

    @task_repository = []
  end

  def add_task(task)
    @task_repository << task
  end

  def show_all
    @task_repository
  end
end
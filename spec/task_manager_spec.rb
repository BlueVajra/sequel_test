require 'task_manager'

describe TaskManager do
  it "adds multiple tasks and returns an array of all tasks" do
    #add a task
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/sequel_test')
    tasks = TaskManager.new(db)
    tasks.add_task({name: "Do One Task"})
    tasks.add_task({name: "Do A Second Task"})
    expected = [{:id=>1, :name=>"Do One Task"}, {:id=>2, :name=>"Do A Second Task"}]
    expect(tasks.show_all).to eq(expected)
  end
end
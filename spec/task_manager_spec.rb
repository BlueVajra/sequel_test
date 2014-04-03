require 'task_manager'

describe TaskManager do
  it "adds multiple tasks and returns an array of all tasks" do

    tasks = TaskManager.new
    tasks.add_task({name: "Do One Task"})
    tasks.add_task({name: "Do A Second Task"})
    expected = [{:name => "Do One Task"}, {name: "Do A Second Task"}]
    expect(tasks.show_all).to eq(expected)
  end
end
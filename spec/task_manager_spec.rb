require 'task_manager'

describe TaskManager do
  before(:each) do
    @db = Sequel.connect('postgres://gschool_user:password@localhost:5432/sequel_test')
    @db.create_table :tasks do
      primary_key :id
      Boolean :completed
      String :name
    end
    @tasks_table = @db[:tasks]
    @tasks = TaskManager.new(@tasks_table)
  end

  after do
    @db.drop_table :tasks
  end

  it "adds multiple tasks and returns an array of all tasks" do

    @tasks.add_task({name: "Do One Task"})
    @tasks.add_task({name: "Do A Second Task"})
    expected = [{:id => 1, :name => "Do One Task", :completed => false}, {:id => 2, :name => "Do A Second Task", :completed => false}]
    expect(@tasks.show_all).to eq(expected)
  end

  it "completes a task" do
    @tasks.add_task({name: "Do One Task"})
    @tasks.add_task({name: "Do Another Task"})
    @tasks.update_task(2, {:completed => true})

    actual = @tasks.show_all
    expected = [{:id => 1, :name => "Do One Task", :completed => false},
                {:id => 2, :name => "Do Another Task", :completed => true}]

    expect(actual).to eq(expected)
  end

  it "completes and updates a task" do
    @tasks.add_task({name: "Do One Task"})
    @tasks.add_task({name: "Do Another Task"})
    @tasks.update_task(2, {:completed => true, name: "Finished Task"})

    actual = @tasks.show_all
    expected = [{:id => 1, :name => "Do One Task", :completed => false},
                {:id => 2, :name => "Finished Task", :completed => true}]

    expect(actual).to eq(expected)
  end

  it "deletes a task" do
    @tasks.add_task({name: "Do One Task"})
    @tasks.add_task({name: "Do Another Task"})
    @tasks.delete_task(1)
    actual = @tasks.show_all
    expected = [{:id => 2, :name => "Do Another Task", :completed => false}]
    expect(actual).to eq(expected)
  end

  it "finds a task by id" do
    @tasks.add_task({name: "Do One Task"})
    @tasks.add_task({name: "Do Another Task"})
    actual = @tasks.find_task(1)
    expected = {:id => 1, :name => "Do One Task", :completed => false}
    expect(actual).to eq(expected)
  end


end
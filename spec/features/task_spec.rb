require_relative '../spec_helper'

describe Task do
  it "should have children tasks" do
    user = User.create(name: "king hobo", password: "hobohobo")
    parent = user.tasks.create(description: "Parent")
    parent.children.create(description: "Child 1", user: user)
    parent.children.create(description: "Child 2", user: user)
    expect(Task.find_by(description: "Child 1").parent).to eq(parent)
  end
end
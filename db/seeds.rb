require 'faker'
require 'tubular-faker'

user = User.create(name: "admin", password: "iluvu")

3.times do
  task = user.tasks.create(description: TubularFaker.name)
  3.times do
    task = task.create_subtask(description: TubularFaker.name)
    3.times do
      task.create_subtask(description: TubularFaker.name)
    end
  end
end

loser = User.create(name: "loser", password: "iluvu")
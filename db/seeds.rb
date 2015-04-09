require 'faker'
require 'tubular-faker'

user = User.create(name: "admin", password: "iluvu")

10.times do
  project = Project.create(description: Faker::Company.bs, user: user)
  4.times do
    project.tasks.create(description: Faker::Commerce.product_name, status: "not started", user: user)
  end
end

loser = User.create(name: "loser", password: "iluvu")

10.times do
  project = Project.create(description: TubularFaker.company, user: loser)
  4.times do
    project.tasks.create(description: TubularFaker.lingo, status: "not started", user: loser)
  end
end

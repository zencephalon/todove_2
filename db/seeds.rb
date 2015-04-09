require 'faker'

user = User.create(name: "admin", password: "iluvu")

10.times do
  project = Project.create(description: Faker::Company.bs, user: user)
  4.times do
    project.tasks.create(description: Faker::Commerce.product_name, status: "not started", user: user)
  end
end
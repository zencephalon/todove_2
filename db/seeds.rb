require 'faker'

10.times do
  project = Project.create(description: Faker::Company.bs)
  4.times do
    project.tasks.create(description: Faker::Commerce.product_name, status: "not started")
  end
end
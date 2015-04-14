require 'faker'
require 'tubular-faker'

user = User.create(name: "admin", password: "iluvu")

loser = User.create(name: "loser", password: "iluvu")
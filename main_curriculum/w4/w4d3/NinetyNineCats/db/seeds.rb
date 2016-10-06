# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(user_name: "Arrowhead", password: "springwater")
u2 = User.create!(user_name: "benq", password: "lv231100")
u3 = User.create!(user_name: "leopard", password: "lunch+box")
u4 = User.create!(user_name: "air_china", password: "alliance")

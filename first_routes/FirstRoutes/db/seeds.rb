# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(username: "Eric")
u2 = User.create!(username: "David")
u3 = User.create!(username: "Ryan")

c1 = Contact.create!(name: "Robert", email: "rbt@gmail.com", user_id: 3)
c2 = Contact.create!(name: "Jenn", email: "Jenn@gmail.com", user_id: 2)
c3 = Contact.create!(name: "Gage", email: "rage@gmail.com", user_id: 1)

#(shares robert with, david)
share1 = ContactShare.create!(contact_id: 1, user_id: 2)
share2 = ContactShare.create!(contact_id: 2, user_id: 1)
share3 = ContactShare.create!(contact_id: 2, user_id: 3)
share4 = ContactShare.create!(contact_id: 3, user_id: 3)

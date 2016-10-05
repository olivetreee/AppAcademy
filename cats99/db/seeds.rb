# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Cat.create!(birth_date: '2015/01/20', color: "white", name: 'Black', sex: 'F')
c2 = Cat.create!(birth_date: '2015/01/22', color: "spotted", name: 'Happy', sex: 'F')
c3 = Cat.create!(birth_date: '2015/01/23', color: "beige", name: 'Charlie', sex: 'M')
c4 = Cat.create!(birth_date: '2015/01/24', color: "black", name: 'HP', sex: 'F')

r1  = CatRentalRequest.create!(cat_id: 1, start_date: '2016/04/01', end_date: '2016/04/10')
r2  = CatRentalRequest.create!(cat_id: 2, start_date: '2016/04/01', end_date: '2016/04/10', status: "APPROVED")
r3  = CatRentalRequest.create!(cat_id: 2, start_date: '2015/04/01', end_date: '2015/04/10', status: "APPROVED")

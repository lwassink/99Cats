# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
# Cat.create!(name: "Fluffy", color: "Purple", sex: "M", birth_date: "2014/01/20")
# Cat.create!(name: "Sally", color: "Black", sex: "F", birth_date: "2013/03/30", description: "App Academy's mascot")
# Cat.create!(name: "Jeremy", color: "White", sex: "M", birth_date: "1850/09/15", description: "He has seen things you people would not believe!")

CatRentalRequest.create!(cat_id: 1, start_date: "2016/01/01", end_date: "2016/12/31", status: "APPROVED")
CatRentalRequest.create!(cat_id: 1, start_date: "2016/06/06", end_date: "2017/06/06", status: "APPROVED")
CatRentalRequest.create!(cat_id: 1, start_date: "1000/01/01", end_date: "1002/01/01", status: "APPROVED")

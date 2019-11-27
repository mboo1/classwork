# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do  
  Cat.destroy_all

#Cats
cat1 = Cat.create!(name: 'Whiskers', color: 'brown', sex: "M", birth_date: '2019/05/20', description: 'Good kitty')
cat2 = Cat.create!(name: 'Paws', color: 'orange', sex: "F", birth_date: '2019/02/12', description: 'Bad kitty')
cat3 = Cat.create!(name: 'Mr. Whiskers', color: 'white', sex: "M", birth_date: '2017/01/12', description: 'kitty')
cat4 = Cat.create!(name: 'Kibbles', color: 'black', sex: "F", birth_date: '2018/06/10', description: 'Great kitty')


end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#管理者email,password
Admin.create!(email: "kazuma.otake14@gmail.com",
             password:  "11111111",
             password_confirmation: "11111111",
             admin: true)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: "admin", last_name: "admin", email: "admin@admin.com", password: "admin", role: "owner")
User.create!(first_name: "admin", last_name: "clerk", email: "clerk@clerk.com", password: "clerk", role: "clerk")
User.create!(first_name: "Walk-In-Customer", last_name: "", email: "cust@cust.com", password: "clerk", role: "customer")
Menu.create!(name: "Default Menu", is_active: true)

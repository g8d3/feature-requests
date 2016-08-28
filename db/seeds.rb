# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Client.find_or_create_by name: 'Client A'
Client.find_or_create_by name: 'Client B'
Client.find_or_create_by name: 'Client C'

[
  'Policies', 'Billing', 'Claims', 'Reports'
].each do |area|
  ProductArea.find_or_create_by name: area
end


User.create_with(password: 'password', password_confirmation: 'password')
  .find_or_create_by email: 'admin@example.com'

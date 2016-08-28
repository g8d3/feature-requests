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

while FeatureRequest.count < 100
  FeatureRequest.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    client: Client.all.sample,
    client_priority: rand(20) + 1,
    target_date: Faker::Date.forward(60),
    ticket_url: Faker::Internet.url,
    product_area: ProductArea.all.sample
  )
end


admin = User.create_with(password: 'password', password_confirmation: 'password')
  .find_or_create_by email: 'admin@example.com'
admin.update role: :admin

guest = User.create_with(password: 'password', password_confirmation: 'password')
  .find_or_create_by email: 'guest@example.com'
guest.update role: :guest

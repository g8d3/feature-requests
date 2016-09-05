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

if ENV['reseed']
  FeatureRequest.delete_all
  Comment.delete_all
end

text = [
  5.times.map{'Faker::Hacker.say_something_smart'},
  2.times.map{'Faker::Hipster.sentence'},
  1.times.map{'Faker::ChuckNorris.fact'}
].flatten

while FeatureRequest.count < 25

  request = FeatureRequest.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    client: Client.all.sample,
    client_priority: rand(20) + 1,
    target_date: Faker::Date.forward(60),
    ticket_url: Faker::Internet.url,
    product_area: ProductArea.all.sample,
  )

  (rand(4) + 2).times.map do |i|
    Comment.create commentable: request, user: User.all.sample, text: eval(text.sample)
  end
end


admin = User.create_with(password: 'password', password_confirmation: 'password')
  .find_or_create_by email: 'admin@example.com'
admin.update role: :admin

guest = User.create_with(password: 'password', password_confirmation: 'password')
  .find_or_create_by email: 'guest@example.com'
guest.update role: :guest

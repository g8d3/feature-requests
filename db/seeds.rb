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

User.create_with(
  username: Faker::Internet.user_name,
  password: 'FakePassword',
  password_confirmation: 'FakePassword',
  role: :admin)
  .find_or_create_by email: 'admin@example.com'

User.create_with(
  username: Faker::Internet.user_name,
  password: 'FakePassword',
  password_confirmation: 'FakePassword',
  role: :guest)
  .find_or_create_by email: 'guest@example.com'

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
    c=Comment.create commentable: request, user: User.all.sample, text: eval(text.sample)
  end
end

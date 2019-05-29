# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'activerecord-reset-pk-sequence'

Item.destroy_all
User.destroy_all
Cart.destroy_all
JoinTableCartItem.destroy_all
Order.destroy_all

Item.reset_pk_sequence
User.reset_pk_sequence
Cart.reset_pk_sequence
JoinTableCartItem.reset_pk_sequence
Order.reset_pk_sequence

10.times do
  Item.create!(
    title: Faker::Creature::Cat.name + " " + Faker::Creature::Cat.name,
    description: "lorem ipsum",
    price: rand(0..100).to_f,
    image_url: "https://images.unsplash.com/photo-1472491235688-bdc81a63246e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
  )
end

10.times do
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	user = User.create!(
		first_name: first_name,
		last_name: last_name,
		email: first_name + last_name + "@gmail.com",
		password: "foobar"
		)
    Cart.create!(
      user_id: user.id
    )
end

20.times do
  JoinTableCartItem.create(
    cart_id: Cart.all.sample.id,
    item_id: Item.all.sample.id
  )
end

10.times do
  Order.create(
    user_id: User.all.sample.id
  )
end

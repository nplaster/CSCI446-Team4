# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create!(email: 'test', password:'test', id: 1)
User.create!(email: 'test2', password:'test', id: 2)

=begin
Item.delete_all
Item.create!(
  name: 'Thumper',
  description:
    %{<p>
        Thumper is a big fun loving rabbit. If you get to know him you'll never be alone.
      </p>},
  image_url:   'bunny.jpg',
  status: 'Available',
  condition: 'New',
  user_id: 1)

Item.create!(
    name: 'Cat',
    description:
    %{<p>
        Cat is missing a leg, will try to find but not so good chance, just sayin'.
      </p>},
    image_url:   'cat.jpg',
    status: 'In Use',
    condition: 'Poor',
    user_id: 1)

Item.create!(
    name: 'Fridge Cat',
    description:
        %{<p>
        Cat likes stuff.
      </p>},
    image_url:   'cat2.jpg',
    status: 'Available',
    condition: 'Good',
    user_id: 1)

Item.create!(
    name: 'Door Stop',
    description:
        %{<p>
        Will not get pushed over
      </p>},
    image_url:   'elephant.jpg',
    status: 'Available',
    condition: 'Excellent',
    user_id: 2)

Bid.create!(
    listing_item_id:4,
    bid_item_id:3
)
Bid.create!(
    listing_item_id:4,
    bid_item_id:2
)
=end

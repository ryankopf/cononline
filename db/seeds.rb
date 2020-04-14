# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
case Rails.env
when "test"
  User.create(email: 'kopf1988+admin@gmail.com')
  u2 = User.create(email: 'kopf1988@gmail.com')
  Vendor.create(name: 'Dragon Vending Company', category: 'dealer', about: 'Dragon vending company sells literal dragons! Not just small parts of dragons, but entire, living, breathing, dragons. Not available in California.', user_id: u2.id, approved: true)

end
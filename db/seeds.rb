require 'faker'

# User test list
User.create!(
             username: "szu",
             email: "szuletett@gmail.com",
             password: "szuletett",
             password_confirmation: "szuletett"
             )
u = User.first

List.create!(
             user: u,
             title: "My first list"
             )
l = List.first

# To do items
25.times do
Item.create!(
             user: u,
             list: l,
             description: Faker::Hacker.verb + " " + Faker::Hacker.adjective + " " + Faker::Hacker.noun,
             remind: false,
             deadline: Date.today+5.day
             )
end

Item.where("id > 20").update_all(:missed => true)
Item.where("id > 20").update_all(:deadline => Date.today-3.day)
Item.where("id > 20").update_all(:updated_at => Date.today-3.day)

Item.where("id < 10").update_all(:done => true)
Item.where("id < 10").update_all(:deadline => Date.today+2.day)
Item.where("id > 20").update_all(:updated_at => Date.today-1.day)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Users 
User.create!(
first_name: "Bob",
last_name: "Pen",
username: "bp",
email: "bob.pen@example.com",
password: "1234",
password_confirmation: "1234",
image: "Blank"
)

User.create!(
first_name: "Pam",
last_name: "Marker",
username: "pammy",
email: "pammymaker@example.com",
password: "1234",
password_confirmation: "1234",
image: "Blank"
)

User.create!(
first_name: "Roger",
last_name: "McRogington",
username: "rogy",
email: "rogy@example.com",
password: "1234",
password_confirmation: "1234",
image: "Blank"
)

User.create!(
first_name: "john",
last_name: "bobs",
username: "jbob",
email: "job@example.com",
password: "1234",
password_confirmation: "1234",
image: "Blank"
)


# Make Events
Event.create!(
event_name: "Go to Wonderland",
description: "I've never been, and im also scared of roller coasters",
event_datetime: "2015-01-15 14:48:00.000000",
location: "Woodbridge, On",
url: "www.wonderland.ca",
)

Event.create!(
event_name: "Roller Disco",
description: "Can someone just take me out and dance disco with me already?",
event_datetime: "2015-01-15 14:48:00.000000",
location: "Mississauga, On",
url: "www.scootersrollerpalace.ca",
)

Event.create!(
event_name: "Go to Las Vagas",
description: "What happens there.. well you know.",
event_datetime: "2015-01-15 14:48:00.000000",
location: "Las Vags, Navada",
url: "www.lasvagas.ca",
)

# Make Friendships

Friendship.create(
user_id: 1,
friend_id: 2,
status: "pending"
)

Friendship.create(
user_id: 1,
friend_id: 3,
status: "requested"
)

Friendship.create(
user_id: 1,
friend_id: 4,
status: "approved"
)
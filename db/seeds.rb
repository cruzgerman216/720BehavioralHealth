# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create( email: "test@test.com", username: "test", first_name: "German", last_name: "Cruz", password: "test", role:0)

c = User.create( email: "emilyrose134@email.com", username: "emilyrose123", first_name: "Emily", last_name: "Rose", password: "test", role:2)
c2 = User.create( email: "jakefromstatefarm@email.com", username: "jakefromstatefarm", first_name: "Jake", last_name: "Robinson", password: "test", role:2)
User.create( email: "Jacob@email.com", username: "Jacob65453", first_name: "Jacob", last_name: "Henderson", password: "test", role:2)
User.create( email: "Luke576@email.com", username: "luke345", first_name: "Luke", last_name: "Jackson", password: "test", role:2)
User.create( email: "jimmy453@email.com", username: "jimmy5425", first_name: "Jimmy", last_name: "Zamora", password: "test", role:2)


bi = User.create(email: "Amy543@email.com", username: "Amy1243",first_name: "Amy", last_name: "Cho", password: "test", role: 1)
pc = User.create( email: "Sarah@email.com",  username: "sarah3252",first_name: "Sarah", last_name: "Miller", password: "test", role:0)

bi2 = User.create(email: "mike64562@email.com", first_name: "Mike", username: "mike5354",last_name: "Lopez", password: "test", role:1)

case1 = Case.create(pc: pc, client: c, bi: bi) 
# [c,pc,bi].each{ |user|
# Casebi.create(case: case1,user_id: user.id)
# }
case2 = Case.create(pc: pc, client: c2, bi: bi) 
# [c2,pc,bi].each{ |user|
# Casebi.create(case: case2,user_id: user.id)
# }
 a = case1.appointments.create(case: case1, from_time: Time.new, to_time: Time.new, date:Date.new)

a2 = case2.appointments.create(case: case2, from_time: Time.new, to_time: Time.new, date:Date.new)

content = "I arrived to session late today!"
content_bi = "Client arrived late to session today."
Comment.create(content: content, appointment: a, user: c)
Comment.create(content: content_bi, appointment: a2, user: bi)

content = "Awesome work!!"
content_bi = "Struggle with words today!."
Comment.create(content: content, appointment:case2.appointments[0], user: c2)
Comment.create(content: content_bi, appointment:case2.appointments[0], user: bi)
# adding more bis to the case

# <%= f.collection_select :case_id, Case.all, :id, :id%>

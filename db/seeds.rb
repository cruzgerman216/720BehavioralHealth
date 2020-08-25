# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create( email: "test@test.com", username: "test", first_name: "test", last_name: "test", password: "test", role:0)

c = User.create( email: "clientemail123@email.com", username: "client_username", first_name: "zclient first name", last_name: "zclient last name", password: "test", role:2)
c2 = User.create( email: "clientemail2@email.com", username: "client_username2", first_name: "client2 first name", last_name: "client2 last name", password: "test", role:2)

bi = User.create(email: "biemail123@email.com", username: "bi_username",first_name: "bi first name", last_name: "bi last name", password: "test", role: 1)
pc = User.create( email: "pcemail123@email.com",  username: "pc_username",first_name: "pc first name", last_name: "pc last name", password: "test", role:0)

bi2 = User.create(email: "bi2", first_name: "bi2 first name", username: "bi2_username",last_name: "bi2 last name", password: "test", role:1)

case1 = Case.create(pc: pc, client: c, bi: bi) 
[c,pc,bi].each{ |user|
Casebi.create(case: case1,user_id: user.id)
}
case2 = Case.create(pc: pc, client: c2, bi: bi) 
[c2,pc,bi].each{ |user|
Casebi.create(case: case1,user_id: user.id)
}
a = Appointment.create(case: case1, from_time: "2000-02-54 16:04:23", to_time: "2000-01-01 20-05-05", date:"2020-05-13")
# Appointmentcase.create(case: case1, appointment: a)
a2 = Appointment.create(case: case1, from_time: "2000-02-54 23:24:23", to_time: "2000-01-01 14-05-07", date:"2020-06-13")
# Appointmentcase.create(case: case2, appointment: a2)

content = "I arrived to session late today!"
content_bi = "Client arrived late to session today."
Comment.create(content: content, appointment:a, user: c)
Comment.create(content: content_bi, appointment:a, user: bi)

content = "Awesome work!!"
content_bi = "Struggle with words today!."
Comment.create(content: content, appointment:a2, user: c2)
Comment.create(content: content_bi, appointment:a2, user: bi)
# adding more bis to the case
# casebi = Casebi.create(case: case1, bi:bi)
# casebi2 = Casebi.create(case: case1, bi:bi2)



# b_i = Bi.create(user: bi)

# case.create(pc, c)

# case_bi.create(c, bi)

# bi.cases 
# c.cases 
# pc.cases 

# case.bis 
# case.pc 
# case.c
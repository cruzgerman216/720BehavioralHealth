# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c = Client.create( email: "clientemail123@email.com", username: "client_username", first_name: "client first name", last_name: "client last name")

bi = Bi.create(email: "biemail123@email.com", first_name: "bi first name", last_name: "bi last name")
pc = Pc.create( email: "pcemail123@email.com",  first_name: "pc first name", last_name: "pc last name")

bi2 = Bi.create(email: "bi2", first_name: "bi2 first name", last_name: "bi2 last name")

case1 = Case.create(pc: pc, client: c) 
casebi = Casebi.create(case: case1, bi:bi)
casebi2 = Casebi.create(case: case1, bi:bi2)



# b_i = Bi.create(user: bi)

# case.create(pc, c)

# case_bi.create(c, bi)

# bi.cases 
# c.cases 
# pc.cases 

# case.bis 
# case.pc 
# case.c
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client = User.create( email: "clientemail123@email.com", username: "client_username", first_name: "client first name", last_name: "client last name")

behavioral_therapist = User.create(email: "biemail123@email.com", first_name: "bi first name", last_name: "bi last name")
program_coordinator = User.create( email: "pcemail123@email.com",  first_name: "pc first name", last_name: "pc last name")

c = Client.create(user_id: behavioral_therapist.id, client_id: client.id)
bi = BehavioralTherapist.create(bi_id: behavioral_therapist.id, user_id: client.id)
pc1 = ProgramCoordinator.create(pc_id: program_coordinator.id, user_id: behavioral_therapist.id)
pc2 = ProgramCoordinator.create(pc_id: 3, user_id: 1)

# case.create(pc, c)

# case_bi.create(c, bi)

# bi.cases 
# c.cases 
# pc.cases 

# case.bis 
# case.pc 
# case.c
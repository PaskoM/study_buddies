# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all 
Location.destroy_all
Subject.destroy_all 

User.create(name:"Mariola", email:"paskomariola@gmail.com", password:"password1")
User.create(name:"Reneta", email:"r.miriuk@gmail.com", password:"password2")

Location.create(name:"Borg", address:"Flatiron, Finsbury Square", city:"London", capacity: 30)
Location.create(name:"Turing", address:"Flatiron, Finsbury Square", city:"London", capacity: 20)

Subject.create(name:"Ruby")
Subject.create(name:"Rails")
Subject.create(name:"HTML")




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

User.create(name:"Mariola", email:"paskomariola@gmail.com", password:"p1")
User.create(name:"Renata", email:"renata@gmail.com", password:"p1")
User.create(name:"Gabi", email:"gabi@gmail.com", password:"p1")
User.create(name:"Anna", email:"anna@gmail.com", password:"p1")
User.create(name:"Sofia", email:"sofia@gmail.com", password:"p1")
User.create(name:"Marcus", email:"marcus@gmail.com", password:"p1")
User.create(name:"Carlo", email:"carlo@gmail.com", password:"p1")
User.create(name:"John", email:"john@gmail.com", password:"p1")

User.create(name:"Mariola", email:"paskomariola2@gmail.com", password:"p1")
User.create(name:"Renata", email:"renata2@gmail.com", password:"p1")
User.create(name:"Gabi", email:"gabi2@gmail.com", password:"p1")
User.create(name:"Anna", email:"anna2@gmail.com", password:"p1")
User.create(name:"Sofia", email:"sofia2@gmail.com", password:"p1")
User.create(name:"Marcus", email:"marcus2@gmail.com", password:"p1")
User.create(name:"Carlo", email:"carlo2@gmail.com", password:"p1")
User.create(name:"John", email:"john2@gmail.com", password:"p1")


Location.create(name:"Borg", address:"Flatiron, Finsbury Square", city:"London", capacity: 30)
Location.create(name:"Turing", address:"Flatiron, Finsbury Square", city:"London", capacity: 20)
Location.create(name:"Lovelace", address:"Flatiron, Finsbury Square", city:"London", capacity: 5)
Location.create(name:"Barness-Lee", address:"Flatiron, Finsbury Square", city:"London", capacity: 12)
Location.create(name:"Hopper", address:"Flatiron, Finsbury Square", city:"London", capacity: 25)


Subject.create(name:"Ruby")
Subject.create(name:"Rails")
Subject.create(name:"HTML & CSS")
Subject.create(name:"JavaScript")
Subject.create(name:"Python")
Subject.create(name:"C++")
Subject.create(name:"UI/UX")
Subject.create(name:"Go")
Subject.create(name:"PHP")
Subject.create(name:"TypeScript")
Subject.create(name:"Java")
Subject.create(name:"Other")

StudyGroup.create(user:User.first,location: Location.first, subject: Subject.first, date:"2020-01-30 09:00",time:"2020-01-30 09:00",duration:1,num_participants:Location.first.capacity,name:"Code Review",description:"nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc")
StudyGroup.create(user:User.second,location: Location.first, subject: Subject.second, date:"2020-01-25 10:00",time:"2020-01-25 10:00",duration:2,num_participants:Location.first.capacity,name:"Survive Guide",description:"mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus")
StudyGroup.create(user:User.third,location: Location.third, subject: Subject.third, date:"2020-01-26 11:00",time:"2020-01-26 11:00",duration:1,num_participants:Location.third.capacity,name:"Next Class Prep",description:"dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa vitae tortor condimentumk")
StudyGroup.create(user:User.fourth,location: Location.fifth, subject: Subject.first, date:"2020-01-26 12:00",time:"2020-01-26 12:00",duration:1,num_participants:Location.fifth.capacity,name:"Coding for dummies",description:"cursus sit amet dictum sit amet justo donec enim diam")
StudyGroup.create(user:User.fifth,location: Location.first, subject: Subject.first, date:"2020-01-28 15:00",time:"2020-01-28 15:00",duration:1,num_participants:Location.first.capacity,name:"Dealing with users",description:"leo integer malesuada nunc vel risus commodo viverra maecenas accumsan")
StudyGroup.create(user:User.first,location: Location.second, subject: Subject.first, date:"2020-01-29 18:00",time:"2020-01-29 18:00",duration:1,num_participants:Location.second.capacity,name:"Code Review 2 - the return",description:"fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec")
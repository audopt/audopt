# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(name: 'Victor', email: 'victor@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 3', phone: '33521539', birth: Time.now)
puts user1.errors.full_messages
user2 = User.create(name: 'Jessica', email: 'jessica@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 32', phone: '33321539', birth: Time.now)
puts user2.errors.full_messages
user3 = User.create(name: 'João Busche', email: 'busche@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 32', phone: '33321539', birth: Time.now)
puts user3.errors.full_messages
user4 = User.create(name: 'Vitor Barbosa', email: 'vitor@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 32', phone: '33321539', birth: Time.now)
puts user4.errors.full_messages

animal1 = Animal.create(name: "Marley", kind: "Cachorro", breed: "Poodle", vaccined: true, castrated: false, sex: 'M', size: "Médio")
puts animal1.errors.full_messages
animal2= Animal.create(name: "Xodó", kind: "Papagaio", breed: "Papagaio Brasileiro", vaccined: false, castrated: false, sex: 'M', size: "Pequeno")
puts animal2.errors.full_messages
animal3 = Animal.create(name: "Bob", kind: "Coelho", breed: "Chinchila padrão", vaccined: false, castrated: false, sex: 'M', size: "Grande")
puts animal3.errors.full_messages

post1 = Post.create(text: "Adote esse aqui!", location: "Taguatinga", user: user1, animal: animal1)
puts post1.errors.full_messages
post2 = Post.create(text: "Adote este!", location: "Valparaíso", user: user2, animal: animal2)
puts post2.errors.full_messages
post3 = Post.create(text: "Adote esse aqui!", location: "Taguatinga", user: user3, animal: animal3)
puts post3.errors.full_messages

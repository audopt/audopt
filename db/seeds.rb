# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(name: 'Victor', email: 'victor@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 3', phone: '33521539', birth: Time.now)
user2 = User.create(name: 'Jessica', email: 'jessica@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 32', phone: '33321539', birth: Time.now)
user3 = User.create(name: 'João Busche', email: 'busche@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 32', phone: '33321539', birth: Time.now)
user4 = User.create(name: 'Vitor Barbosa', email: 'vitor@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 32', phone: '33321539', birth: Time.now)

animal1 = Animal.create(name: "Marley", kind: "Cachorro", breed: "Poodle", vaccined: true, castrated: false, sex: 'M', size: "Medium", adopted: false)
animal2= Animal.create(name: "Xodó", kind: "Papagaio", breed: "Papagaio Brasileiro", vaccined: false, castrated: false, sex: 'M', size: "Small", adopted: false)
animal3 = Animal.create(name: "Bob", kind: "Coelho", breed: "Chinchila padrão", vaccined: false, castrated: false, sex: 'M', size: "Medium", adopted: false)

post1 = Post.create(text: "Adote esse aqui!", location: "Taguatinga", user_id: user1, animal: animal1)
post2 = Post.create(text: "Adote este!", location: "Valparaíso", user_id: user2, animal: animal2)
post3 = Post.create(text: "Adote esse aqui!", location: "Taguatinga", user_id: user3, animal: animal3)

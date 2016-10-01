# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vitor = User.create(name: 'Victor', email: 'victor@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 3', phone: '33521539', birth: Time.now)
jess = User.create(name: 'Jessica', email: 'jessica@gmail.com', password: 'omelete1', password_confirmation: 'omelete1', address: 'SMT conj 32', phone: '33321539', birth: Time.now)

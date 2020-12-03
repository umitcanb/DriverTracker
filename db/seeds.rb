# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = Driver.create(
                                    name: 'Admin',
                                    surname: 'Admin',
                                    city: 'Barcelona',
                                    email: 'admin@test',
                                    password: '123456',
                                    password_confirmation: '123456')


driver1 = Driver.create(
                                    name: 'Umit',
                                    surname: 'Batur',
                                    city: 'Barcelona',
                                    email: 'umit@test',
                                    password: '123456',
                                    password_confirmation: '123456')

driver2 = Driver.create(
                                    name: 'Joan',
                                    surname: 'Nic',
                                    city: 'Barcelona',
                                    email: 'joan@test',
                                    password: '123456',
                                    password_confirmation: '123456')

driver2 = Driver.create(
                                    name: 'Devin',
                                    surname: 'Oz',
                                    city: 'Barcelona',
                                    email: 'devin@test',
                                    password: '123456',
                                    password_confirmation: '123456')                                   

driver3 = Driver.create(
                                    name: 'Natali',
                                    surname: 'Mat',
                                    city: 'Barcelona',
                                    email: 'nat@test',
                                    password: '123456',
                                    password_confirmation: '123456')  


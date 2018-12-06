# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(login: 'admin',
                    password: 'password',
                    firstname: "Stephen",
                    lastname: "Aghaulor",
                    avatar_url:"https://secure.gravatar.com/avatar/894c4c574d4ea5c331bb63f5bc339a76.png"
 )
user2 = User.create(login: 'user', password: 'password')
Todo.create(body: "Make the app secure!", user_id: user1.id)
Todo.create(body: "Rotate the leaked keys!", user_id: user1.id)
Todo.create(body: "Make the app beautiful!", user_id: user2.id)
Todo.create(body: "Learn React!", user_id: user2.id)

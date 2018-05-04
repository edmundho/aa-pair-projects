# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

User.create!({username: "Edmund"})
User.create!({username: "Meenakshi"})

Poll.create!({title: "a/A Satisfaction", user_id: User.first.id})
Poll.create!({title: "Breaks", user_id: User.last.id})

Question.create!({text: "Do you like a/A?", poll_id: Poll.first.id})
Question.create!({text: "Do you want a break?", poll_id: Poll.last.id})

AnswerChoice.create!({text: "Maybe", question_id: Question.first.id})
AnswerChoice.create!({text: "Definitely", question_id: Question.first.id})
AnswerChoice.create!({text: "No", question_id: Question.first.id})
AnswerChoice.create!({text: "No", question_id: Question.all[1].id})
AnswerChoice.create!({text: "Yes", question_id: Question.all[1].id})

Response.create!({user_id: User.first.id, answer_id: AnswerChoice.all[1].id})
Response.create!({user_id: User.first.id, answer_id: AnswerChoice.all[3].id})
Response.create!({user_id: User.last.id, answer_id: AnswerChoice.first.id})
Response.create!({user_id: User.last.id, answer_id: AnswerChoice.all[4].id})

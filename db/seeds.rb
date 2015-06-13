# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


author = Author.create!(first_name: "LL", last_name: "Cool J", email: "ll@coolj.com",
    password_digest: BCrypt::Password.create("llcoolj"))

survey = Survey.create!(author_id: author.id, title: "LL Cool (Sur)Vey",
    description: "Here's an optional description of this super cool survey.",
    published: false)

q1 = Question.create(survey_id: survey.id, question_text: "This is a long-answer question. What do you think about that?",
    question_info: "This is the optional description for Question 1. This question doesn't require an answer.",
    question_type: "Text - Long", required: false, order_number: 1)

q2 = Question.create(survey_id: survey.id, question_text: "This is a short-answer question. What's your name?",
    question_info: "This is the optional description for Question 2. This question requires an answer.",
    question_type: "Text - Short", required: true, order_number: 2)

q3 = Question.create(survey_id: survey.id, question_text: "Is this is a required Yes or No question with no optional description?",
    question_type: "Yes or No", required: true, order_number: 3)

q4 = Question.create(survey_id: survey.id, question_text: "Check here if this is a non-required Checkbox question with no optional description.",
    question_type: "Checkbox", required: false, order_number: 4)

yes_no_options = [true, false]
checkbox_options = [0, 1]

10.times do
  submission = Submission.create!(survey_id: survey.id)
  a1 = Answer.create!(submission_id: submission.id, question_id: q1.id, response: Faker::Lorem.paragraph)
  a2 = Answer.create!(submission_id: submission.id, question_id: q2.id, response: Faker::Name.name)
  a3 = Answer.create!(submission_id: submission.id, question_id: q3.id, response: yes_no_options.sample )
  a4 = Answer.create!(submission_id: submission.id, question_id: q4.id, response: checkbox_options.sample )
end

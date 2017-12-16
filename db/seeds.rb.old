
# 10.times do
#   Attendee.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     title: Faker::Name.title,
#     suffix: Faker::Name.suffix
#   )
#
#   Instructor.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   title: Faker::Name.title,
#   suffix: Faker::Name.suffix
#     )
#
#
# end

# User.create!([
#   {email: "user1@test.com", password: "user1user1", password_confirmation: "user1user1", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
#   {email: "user2@test.com", password: "user2user2", password_confirmation: "user2user2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
#   {email: "user3@test.com", password: "user3user3", password_confirmation: "user3user3", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:44", last_sign_in_at: "2015-02-06 14:03:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
# ])

10.times do

  # Question.create(
  # text_content: "Huh what?"
  #   )

    Course.create(
      title: Faker::Hipster.sentence(3),
      location: Faker::Address.community,
      credits: Faker::Number.between(1, 10),
      learning_objective_1: Faker::Hipster.sentence,
      learning_objective_3: Faker::Hipster.sentence,
      learning_objective_2: Faker::Hipster.sentence,
      start_date: Faker::Date.between(50.days.from_now, 80.days.from_now),
      end_date: Faker::Date.between(90.days.from_now, 100.days.from_now),
      published: Faker::Boolean.boolean,
      instructor_id: Faker::Number.between(1, 10)
      )
end

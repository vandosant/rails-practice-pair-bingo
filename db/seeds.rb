User.destroy_all

User.create!(
  name: "Some User",
  email: 'user@example.com',
  photo_name: 'face-01.jpeg',
  password: 'password',
  password_confirmation: 'password'
)

%w(02 03 04 05 06 07 08 09 10).each do |suffix|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    photo_name: "face-#{suffix}.jpeg",
    password: 'password',
    password_confirmation: 'password'
  )
end

def create_user(overrides = {})
  User.create!({
    name: 'Some User',
    email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password',
    photo_name: "face-01.jpeg"
  }.merge(overrides))
end
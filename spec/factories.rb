# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.email                 "kg@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :dream do |dream|
  dream.content "Foo bar"
  dream.association :user
end

Factory.define :highlight do |highlight|
  highlight.content "Foo bar"
  highlight.association :user
end
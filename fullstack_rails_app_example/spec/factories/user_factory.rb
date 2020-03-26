# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123123' }

    after :create do |user|
      user.update_column :auth_token, JwtService.encode(user)
    end
  end
end

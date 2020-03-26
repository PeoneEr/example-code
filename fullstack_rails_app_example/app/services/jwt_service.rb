# frozen_string_literal: true

require 'jwt'

class JwtService
  SECRET = ENV['SECRET_KEY'] || Settings['app.secret']

  class << self
    def decode(token)
      JWT.decode(token, SECRET).first['id']
    end

    def encode(user)
      payload = { id: user.id }

      JWT.encode payload, SECRET
    end
  end
end

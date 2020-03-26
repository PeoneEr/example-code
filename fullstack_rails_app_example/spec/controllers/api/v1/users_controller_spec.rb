# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  context 'with user' do
    login_user

    it 'returns current user for /api/v1/users/me request' do
      get :me

      expect(response.status).to eq(200)
      expect(response).to render_template('me')
    end
  end
end

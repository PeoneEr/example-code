# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JwtService, type: :service do
  let(:user) { create(:user) }

  before(:each) do
    result = JwtService.encode(user)

    user.update_column :auth_token, result
  end

  it 'encode data' do
    result = JwtService.encode(user)

    expect(result).to be_present
  end

  it 'decode data' do
    result = JwtService.decode(user.auth_token)

    expect(result).to eq(user.id)
  end
end

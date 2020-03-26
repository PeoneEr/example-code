# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feed, type: :model do
  let(:user) { create(:user) }

  it 'create valid feed' do
    feed = Feed.create(user: user)

    expect(feed).to be_persisted
  end

  it 'not create feed without user' do
    feed = Feed.create

    expect(feed).not_to be_persisted
  end
end

# == Schema Information
#
# Table name: feeds
#
#  id            :integer          not null, primary key
#  title         :string
#  search_query  :string
#  search_region :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

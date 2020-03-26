# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Commands::Feed::Create, type: :command do
  let(:user) { create(:user) }

  it 'create feed' do
    params = {
      title: 'title',
      search_query: 'query',
      search_region: 'region'
    }

    expect(user.feeds.count).to eq(0)

    feed = described_class.new(user, params).call

    expect(feed).to be_persisted
    expect(user.feeds.count).to eq(1)
  end
end

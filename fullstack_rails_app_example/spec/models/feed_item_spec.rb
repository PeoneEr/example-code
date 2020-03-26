# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeedItem, type: :model do
  let(:user) { create(:user) }
  let(:feed) { create(:feed, user: user) }

  it 'create feed_item for feed' do
    feed_item = FeedItem.create(feed: feed)

    expect(feed_item).to be_persisted
  end

  it 'not create feed_item without feed' do
    feed_item = FeedItem.create

    expect(feed_item).not_to be_persisted
  end
end

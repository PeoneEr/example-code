# frozen_string_literal: true

class Feed::ParseJob < ApplicationJob
  queue_as :parse

  def perform(feed_id)
    feed = Feed.find(feed_id)

    data = RegisteredParsersService.new(feed).call

    data.each do |item|
      Commands::FeedItem::Create.new(item, feed).call
    end
  ensure
    feed.update_column :parsed, true
    ActionCable.server.broadcast 'feed_channel', user_id: feed.user_id, feed_id: feed.id
  end
end

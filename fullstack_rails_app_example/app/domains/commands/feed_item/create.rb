# frozen_string_literal: true

class Commands::FeedItem::Create
  attr_reader :data, :feed

  def initialize(data, feed)
    @data = data
    @feed = feed
  end

  def call
    feed.items.where(data).first_or_create
  end
end

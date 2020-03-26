# frozen_string_literal: true

class FeedChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'feed_channel'
  end
end

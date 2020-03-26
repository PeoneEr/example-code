# frozen_string_literal: true

class Commands::Feed::Refresh
  attr_reader :feed_id

  def initialize(feed_id)
    @feed_id = feed_id
  end

  def call
    Feed::ParseJob.perform_later(feed_id)
  end
end

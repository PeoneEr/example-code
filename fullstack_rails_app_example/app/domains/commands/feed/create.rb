# frozen_string_literal: true

class Commands::Feed::Create
  def initialize(current_user, params)
    @params = params
    @current_user = current_user
  end

  def call
    feed = @current_user.feeds.create(@params)

    Feed::ParseJob.perform_later(feed.id)

    feed
  end
end

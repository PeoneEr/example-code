# frozen_string_literal: true

class Presenters::FeedItems
  class << self
    def present_for(current_user, feed_id)
      feed = current_user.feeds.find(feed_id)

      feed.items.ordered_by_created_at_desc.visible
    end
  end
end

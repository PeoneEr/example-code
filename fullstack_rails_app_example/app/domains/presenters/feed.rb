# frozen_string_literal: true

class Presenters::Feed
  class << self
    def present_for(current_user, page, per_page)
      current_user.feeds.ordered_by_created_at_desc.page(page).per(per_page)
    end
  end
end

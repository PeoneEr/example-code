# frozen_string_literal: true

class Api::V1::FeedItemsController < Api::V1::ApplicationController
  def index
    @feed_items = Presenters::FeedItems.present_for(current_user, params[:feed_id])
  end

  def hide
    @feed_item = FeedItem.find(params[:id])

    @feed_item.update_column :visible, false
  end
end

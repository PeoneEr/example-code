# frozen_string_literal: true

class Api::V1::FeedsController < Api::V1::ApplicationController
  def index
    @feeds = Presenters::Feed.present_for(current_user, page, per_page)
  end

  def show
    @feed = Feed.find(params[:id])
  end

  def create
    @feed = Commands::Feed::Create.new(current_user, permitted_params).call
  end

  def refresh
    Commands::Feed::Refresh.new(params[:id]).call
  end

  private

  def permitted_params
    params.require(:feed).permit(:title, :search_query, :search_region)
  end
end

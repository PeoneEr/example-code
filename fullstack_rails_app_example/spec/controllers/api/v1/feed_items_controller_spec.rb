# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::FeedItemsController, type: :controller do
  render_views

  context 'with user' do
    login_user

    let!(:feed) { create(:feed, user: @user) }
    let!(:feed_item) { create(:feed_item, feed: feed) }

    it 'returns feed items' do
      get :index, params: { feed_id: feed.id }

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body['feed_items'].size).to eq(1)
    end
  end

  context 'without user' do
    it 'returns 403' do
      get :index, params: { feed_id: 1 }

      expect(response.status).to eq(403)
    end
  end
end

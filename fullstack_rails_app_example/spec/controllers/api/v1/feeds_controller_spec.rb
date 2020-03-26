# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::FeedsController, type: :controller do
  render_views

  context 'with user' do
    login_user

    let(:another_user) { create(:user) }
    let!(:feeds) { create_list(:feed, 5, user: @user) }
    let!(:another_feeds) { create_list(:feed, 5, user: another_user) }

    it 'returns list feeds for user' do
      get :index

      expect(response).to have_http_status(:ok)

      body = JSON.parse(response.body)
      expect(body['feeds'].size).to eq(5)
    end

    it 'returns feed' do
      get :show, params: { id: feeds.first.id }

      expect(response).to have_http_status(:ok)
    end

    it 'refrehs feed' do
      put :refresh, params: { id: feeds.first.id }
      expect(response).to have_http_status(:no_content)
    end

    it 'create feed' do
      params = { feed: { title: 'title', search_query: 'search_query', search_region: 'search_region' } }

      expect { post :create, params: params }.to change { @user.feeds.count }

      expect(response).to have_http_status(:ok)
    end
  end

  context 'without user' do
    let(:user) { create(:user) }
    let!(:feed) { create(:feed, user: user) }

    it 'returns 403 for index' do
      get :index

      expect(response).to have_http_status(403)
    end

    it 'returnrs 403 for show' do
      get :show, params: { id: feed.id }

      expect(response.status).to eq(403)
    end
  end
end

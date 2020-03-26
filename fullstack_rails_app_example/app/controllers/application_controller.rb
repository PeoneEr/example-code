# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :store_auth_token, if: -> { current_user.present? }

  def index
    render inline: '', layout: 'application'
  end

  private

  def store_auth_token
    return if current_user.auth_token.present?

    current_user.update_column :auth_token, JwtService.encode(current_user)
  end

  def page
    params[:page] || 1
  end

  def per_page
    params[:per_page] || 20
  end
end

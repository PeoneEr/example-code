# frozen_string_literal: true

class Api::ApplicationController < ApplicationController
  before_action :check_user

  def check_user
    head 403 if !current_user && controller_name != 'users'
  end
end

# frozen_string_literal: true

class Feed < ApplicationRecord
  belongs_to :user

  has_many :items, class_name: 'FeedItem', dependent: :destroy

  scope :ordered_by_created_at_asc, -> { order(created_at: :asc) }
  scope :ordered_by_created_at_desc, -> { order(created_at: :desc) }
end

# == Schema Information
#
# Table name: feeds
#
#  id            :integer          not null, primary key
#  title         :string
#  search_query  :string
#  search_region :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

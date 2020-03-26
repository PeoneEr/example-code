# frozen_string_literal: true

class FeedItem < ApplicationRecord
  belongs_to :feed

  scope :ordered_by_created_at_desc, -> { order(created_at: :desc) }
  scope :visible, -> { where(visible: true) }
end

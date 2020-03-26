# frozen_string_literal: true

json.set! :feed_items do
  json.array! @feed_items do |feed_item|
    json.partial! 'feed_item', feed_item: feed_item
  end
end

# frozen_string_literal: true

json.set! :feeds do
  json.array! @feeds do |feed|
    json.partial! 'feed', feed: feed
  end
end

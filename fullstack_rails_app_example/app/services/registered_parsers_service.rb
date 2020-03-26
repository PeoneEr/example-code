# frozen_string_literal: true

class RegisteredParsersService
  attr_reader :feed, :data

  def initialize(feed)
    @feed = feed
    @data = []
  end

  def call
    parsers.each do |parser|
      data << parser.new(feed.search_query, feed.search_region).call
    end

    data.flatten
  end

  private

  def parsers
    Dir['app/services/parsers/**'].reject { |name| name =~ /base/ }.map do |file_path|
      "Parsers::#{file_path.split('/').last.gsub('.rb', '').classify}".constantize
    end
  end
end

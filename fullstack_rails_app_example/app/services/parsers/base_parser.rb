# frozen_string_literal: true

require 'open-uri'

class Parsers::BaseParser
  attr_reader :offset, :data, :search_query, :search_region

  REQUIRED_ROWS = 20

  def initialize(search_query, search_region)
    @offset = 0
    @data = []
    @search_query = search_query
    @search_region = search_region
  end

  def call
    while data.size < REQUIRED_ROWS
      break if nokogiri_document.search(card_class).blank?

      nokogiri_document.search(card_class).each do |row|
        data << extract_data_from(row)
      end

      next_offset
    end

    data
  end

  private

  def nokogiri_document
    @nokogiri_document ||= Nokogiri::HTML(open(URI.encode(url)))
  end

  def extract_data_from(row)
    {
      title: row.at(title_class)&.text,
      company: row.at(company_class)&.text,
      location: row.at(location_class)&.text,
      description: row.at(description_class)&.text,
      salary: handle_salary(row.at(salary_class)&.text),
      label: label,
      link: link(row)
    }
  end

  def base_url
    raise 'Override it!'
  end

  def handle_salary(salary)
    salary
  end

  def label; end

  def link(row); end
end

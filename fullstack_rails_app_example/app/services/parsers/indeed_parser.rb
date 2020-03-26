# frozen_string_literal: true

class Parsers::IndeedParser < Parsers::BaseParser
  private

  def next_offset
    @offset += 10
  end

  def base_url
    'https://ru.indeed.com'
  end

  def url
    "#{base_url}/jobs?q=#{search_query}&l=#{search_region}&start=#{offset}"
  end

  def card_class
    '.jobsearch-SerpJobCard'
  end

  def title_class
    '.jobtitle'
  end

  def company_class
    '.company'
  end

  def location_class
    '.location'
  end

  def description_class
    '.summary'
  end

  def salary_class
    '.salaryText'
  end

  def label
    'Indeed'
  end

  def link(row)
    "#{base_url}/#{row.at(title_class)['href']}"
  end
end

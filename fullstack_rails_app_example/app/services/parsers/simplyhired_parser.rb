# frozen_string_literal: true

class Parsers::SimplyhiredParser < Parsers::BaseParser
  private

  def next_offset
    @offset += 1
  end

  def base_url
    'https://www.simplyhired.com'
  end

  def url
    "#{base_url}/search?q=#{search_query}&l=#{search_region}&pn=#{offset}"
  end

  def card_class
    '.SerpJob-jobCard'
  end

  def title_class
    '.card-link'
  end

  def company_class
    '.jobposting-company'
  end

  def location_class
    '.jobposting-location'
  end

  def description_class
    '.jobposting-snippet'
  end

  def salary_class
    '.jobposting-salary'
  end

  def handle_salary(salary)
    return salary unless salary

    original = salary

    begin
      text = salary.gsub(/[^\d*,\d*$]/, ' ').squish.split(' ').join(' - ')

      text += ' в год' if original =~ /a year/
      text += ' в месяц' if original =~ /month/

      text
    rescue StandardError
      salary
    end
  end

  def label
    'Simplyhired'
  end

  def link(row)
    "#{base_url}/#{row.at(title_class)['href']}"
  end
end

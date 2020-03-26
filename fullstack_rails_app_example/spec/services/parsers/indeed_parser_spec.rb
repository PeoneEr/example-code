# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parsers::IndeedParser, type: :service, vcr: true do
  it 'parse data' do
    data = described_class.new('rails', 'Москва').call

    expect(data).to be_present
    first_record = data.first

    expect(first_record[:title]).to eq("\nRuby on Rails Developer (Cloned)")
    expect(first_record[:company]).to eq("\nSphere Inc.")
  end
end

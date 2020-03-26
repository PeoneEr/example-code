# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parsers::SimplyhiredParser, type: :service, vcr: true do
  it 'parse data' do
    data = described_class.new('rails', 'Texas').call

    expect(data).to be_present
    first_record = data.first

    expect(first_record[:title]).to eq('Global IT Information Architect')
    expect(first_record[:company]).to eq('Hewlett Packard Enterprise')
    expect(first_record[:salary]).to eq('$130,000 - $180,000 в год')
  end
end

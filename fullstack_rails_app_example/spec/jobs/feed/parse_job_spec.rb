# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feed::ParseJob, type: :job, vcr: true do
  include ActiveJob::TestHelper

  let(:user) { create(:user) }
  let(:feed) { create(:feed, user: user) }

  subject { described_class.perform_later(feed.id) }

  it 'queue the job' do
    expect { subject }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in parse queue' do
    expect(Feed::ParseJob.new.queue_name).to eq('parse')
  end

  it 'executes perform' do
    perform_enqueued_jobs { subject }
  end
end

require 'spec_helper'
require_relative '../lib/log_reader'

describe LogReader do
  let(:log_file) { "spec/test_data/test.log" }
  let(:log_reader) { described_class.new(log_file) }

  before(:each) do
    log_reader.parse_log_file
  end

  describe "#parse_log_file" do
    it 'reads all lines from file' do
      expect(log_reader.log_items.size).to eq(7)
    end

  end

  describe "#pages_by_views" do
    it 'organizes pages by number of views and sorts them' do
      views = log_reader.pages_by_views

      expect(views).to eq([["/help_page/1", 4], ["/about", 2], ["/home", 1]])
    end
  end

  describe "#pages_by_unique_visits" do
    it 'organizes pages by unique number of unique visitors and sorts them' do
      visits = log_reader.pages_by_unique_visits

      expect(visits).to eq([["/help_page/1", 3], ["/about", 1], ["/home", 1]])
    end
  end

end

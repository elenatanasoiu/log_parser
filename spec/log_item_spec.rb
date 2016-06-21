require 'spec_helper'
require_relative '../lib/log_item'

describe LogItem do

  let(:log_item) do
    described_class.new("/help_page/1", "126.318.035.038")
  end

  describe "#initialize" do
    it 'sets url correctly' do
      expect(log_item.url).to eq("/help_page/1")
    end

    it 'sets ip address correctly' do
      expect(log_item.ip).to eq("126.318.035.038")
    end
  end

end
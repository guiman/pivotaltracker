require 'spec_helper'

describe PivotalTracker::API::TestClient do

  describe "#cassette_name" do
    it "returns a cassette name with pivotaltracker" do
      client = described_class.new('123')
      expect(client.cassette_name('dummy', '20')).to match(/\Apivotaltracker/)
    end

    it "returns a cassette name with limit on it" do
      client = described_class.new('123')
      expect(client.cassette_name('dummy', '20')).to match(/limit_20\z/)
    end
  end
end

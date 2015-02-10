require 'spec_helper'

describe PivotalTracker::API do
  let(:token) { "token" }

  describe ".configure" do
    it "stores configuration" do
      described_class.configure { |config| config.token = token }

      expect(described_class.configuration.token).to eq(token)
    end

    after(:each) do
      described_class.reset!
    end
  end

  describe ".reset!" do
    it "resets the configuration" do
      described_class.configure { |config| config.token = token }

      described_class.reset!

      expect(described_class.configuration.token).to be_nil
    end
  end
end

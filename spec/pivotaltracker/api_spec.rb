require 'spec_helper'

describe PivotalTracker::API do
  let(:token) { "token" }

  describe ".configure" do
    it "stores configuration" do
      described_class.configure { |config| config.token = token }

      expect(described_class.configuration.token).to eq(token)
      expect(described_class.configuration.client).to eq(PivotalTracker::API::Client)
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

  describe ".build_client" do
    it "builds the instance from the injected adapter class" do
      described_class.configure do |config|
        config.token = token
        config.client = ::PivotalTracker::API::TestClient
      end

      expect(described_class.build_client).to be_a(::PivotalTracker::API::TestClient)
    end
  end
end

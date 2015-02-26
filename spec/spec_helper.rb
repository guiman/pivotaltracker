require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'pivotaltracker'
require 'vcr'
require 'byebug'
require 'webmock'
require 'support/test_api_setup'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

VCR.configure do |config|
  config.cassette_library_dir = File.join(__dir__, 'fixtures', 'vcr_cassettes')
  config.hook_into :webmock
end

module PivotalTracker
  class API
    class TestClient < ::PivotalTracker::API::Client
      def get(endpoint, id, options={})
        casette =  if id < 0
          "non_existing"
        else
          "#{id}"
        end

        resource = endpoint.gsub('/', '')
        casette.prepend("#{resource}")

        VCR.use_cassette(casette) do
          super(endpoint, id, options)
        end
      end
    end
  end
end

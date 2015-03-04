require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'pivotaltracker'
require 'byebug'
require 'support/test_api_setup'
require 'pivotaltracker/api/test_client'

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
  config.ignore_hosts 'codeclimate.com'
end

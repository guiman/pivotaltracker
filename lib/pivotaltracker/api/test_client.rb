require 'vcr'
require 'webmock'

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

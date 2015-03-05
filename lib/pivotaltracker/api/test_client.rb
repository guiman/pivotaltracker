require 'vcr'
require 'webmock'

module PivotalTracker
  class API
    class TestClient < ::PivotalTracker::API::Client
      def get(endpoint, id, options={})
        id = id.to_i
        cassette =  if id < 0
          "non_existing"
        else
          "#{id}"
        end

        resource = endpoint.gsub('/', '')
        cassette.prepend("#{resource}")

        VCR.use_cassette(cassette_name(cassette, options[:limit])) do
          super(endpoint, id, options)
        end
      end

      def cassette_name(casette, limit=nil)
        casette.concat("limit_#{limit}") if limit
        casette.prepend("pivotaltracker_")
      end
    end
  end
end

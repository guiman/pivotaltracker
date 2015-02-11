module PivotalTracker
  class API
    class Client
      def initialize(token, adapter=::Faraday)
        @adapter = adapter
        @token = token
      end

      def get(endpoint, id, options={})
        endpoint_url = build_url(endpoint, id, options)
        connection = @adapter.new(url: ::PivotalTracker::API::HOST)
        response = connection.get(endpoint_url) { |req| req.headers['X-TrackerToken'] = @token }
        response
      end

      private

      def build_url(endpoint, id, options={})
        "services/v5/#{endpoint}/#{id}"
      end
    end
  end
end

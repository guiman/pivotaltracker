module PivotalTracker
  class API
    class Client
      def initialize(token, adapter=::Faraday)
        @adapter = adapter
        @token = token
      end

      def get(endpoint, id)
        endpoint_url = build_url(endpoint, id)
        connection = @adapter.new(url: ::PivotalTracker::API::HOST)
        response = connection.get(endpoint_url) { |req| req.headers['X-TrackerToken'] = @token }
        response
      end

      private

      def build_url(endpoint, id)
        parsed_endpoint = endpoint.gsub(/:project_id/, id.to_s)
        "services/v5/#{parsed_endpoint}"
      end
    end
  end
end

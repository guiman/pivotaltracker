module PivotalTracker
  class API
    class Configuration
      attr_accessor :token, :client

      def initialize(client=PivotalTracker::API::Client)
        @client = client
      end
    end
  end
end

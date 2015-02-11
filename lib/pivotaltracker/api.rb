require 'pivotaltracker/api/configuration'
require 'pivotaltracker/api/client'
require 'pivotaltracker/api/host'

module PivotalTracker
  class API
    def self.configure
      yield(configuration)
    end

    def self.reset!
      @configuration = Configuration.new
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.build_client
      @configuration.client.new(@configuration.token)
    end
  end
end

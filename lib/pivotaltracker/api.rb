require 'pivotaltracker/api/configuration'
require 'pivotaltracker/api/client'

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
  end
end

require 'json'

module PivotalTracker
  class Project
    PROJECT_ENDPOINT = "projects"

    attr_reader :id

    def self.find(id)
      client = PivotalTracker::API.build_client
      response = client.get(PROJECT_ENDPOINT, id) # PIVOTAL_API + PROJECT_ENDPOINT + id
      raise NoProjectError.new(id) if response.status != 200
      build_instance(::JSON.parse(response.body))
    end

    private

    def initialize(id)
      @id = id
    end

    def self.build_instance(response)
      self.new(response.fetch("id").to_i)
    end
  end
end

module PivotalTracker
  class Project
    PROJECT_ENDPOINT = "projects/"

    def self.find(id)
      client = PivotalTracker::API.configuration.client.new
      response = client.get(PROJECT_ENDPOINT, id) # PIVOTAL_API + PROJECT_ENDPOINT + id
      raise NoProjectError.new(id) if response.failure?
      build_instance(response)
    end

    private

    attr_reader :id

    def initialize(id)
      @id = id
    end

    def self.build_instance(response)
      self.new(response.fetch("id"))
    end
  end
end

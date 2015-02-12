require 'json'

module PivotalTracker
  class Project
    PROJECT_ENDPOINT = "projects/:project_id"

    attr_reader :id

    def self.find(id)
      client = PivotalTracker::API.build_client
      response = client.get(PROJECT_ENDPOINT, id)
      raise NoProjectError.new(id) if response.status != 200
      build_instance(::JSON.parse(response.body))
    end

    def stories
      client = PivotalTracker::API.build_client
      response = client.get(::PivotalTracker::Story::STORIES_ENDPOINT, id)
      raise NoProjectError.new(id) if response.status != 200
      ::JSON.parse(response.body).map do |story_hash|
        ::PivotalTracker::Story.build_instance(story_hash)
      end
    end

    private

    def initialize(id)
      @id = id
    end

    def self.build_instance(response)
      self.new(response.fetch("id"))
    end
  end
end

require 'json'

module PivotalTracker
  class Project
    PROJECT_ENDPOINT = "projects/:project_id"

    def self.find(id)
      client = PivotalTracker::API.build_client
      response = client.get(PROJECT_ENDPOINT, id)
      raise NoProjectError.new(id) if response.status != 200
      ::PivotalTracker::Resource::Project.new(::JSON.parse(response.body))
    end
  end
end

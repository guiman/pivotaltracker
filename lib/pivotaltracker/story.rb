module PivotalTracker
  class Story
    attr_reader :id

    STORIES_ENDPOINT = "projects/:project_id/stories"

    def self.build_instance(response)
      self.new(response.fetch("id"))
    end

    private

    def initialize(id)
      @id = id
    end
  end
end

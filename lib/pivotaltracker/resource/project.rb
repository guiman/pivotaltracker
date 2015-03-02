module PivotalTracker
  module Resource
    class Project
      attr_reader :id

      def initialize(data)
        @id = data.fetch("id")
      end

      def stories
        client = PivotalTracker::API.build_client
        response = client.get(::PivotalTracker::Story::STORIES_ENDPOINT, id)
        raise NoProjectError.new(id) if response.status != 200
        ::JSON.parse(response.body).map do |story_hash|
          ::PivotalTracker::Resource::Story.new(story_hash)
        end
      end

      def iterations
        client = PivotalTracker::API.build_client
        response = client.get(::PivotalTracker::Iteration::ITERATIONS_ENDPOINT, id)
        raise NoProjectError.new(id) if response.status != 200
        ::JSON.parse(response.body).map do |iteration_hash|
          ::PivotalTracker::Resource::Iteration.new(iteration_hash)
        end
      end
    end
  end
end

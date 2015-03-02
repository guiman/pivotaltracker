module PivotalTracker
  module Resource
    class Project
      include Comparable

      attr_reader :id

      def initialize(data)
        @id = data.fetch("id")
      end

      def stories
        fetch(::PivotalTracker::Story::STORIES_ENDPOINT, ::PivotalTracker::Resource::Story)
      end

      def iterations
        fetch(::PivotalTracker::Iteration::ITERATIONS_ENDPOINT, ::PivotalTracker::Resource::Iteration)
      end

      def <=>(another_project)
        id <=> another_project.id
      end

      private

      def fetch(endpoint, resource_klass)
        client = PivotalTracker::API.build_client
        response = client.get(endpoint, id)
        raise NoProjectError.new(id) if response.status != 200
        ::JSON.parse(response.body).map do |data|
          resource_klass.new(data)
        end
      end
    end
  end
end

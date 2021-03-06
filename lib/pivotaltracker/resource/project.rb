module PivotalTracker
  module Resource
    class Project
      include Comparable

      attr_reader :id, :name

      def initialize(data)
        @id = data.fetch("id")
        @name  = data.fetch("name", nil)
      end

      def stories(limit: 100)
        fetch(::PivotalTracker::Story::STORIES_ENDPOINT, ::PivotalTracker::Resource::Story, limit)
      end

      def iterations
        fetch(::PivotalTracker::Iteration::ITERATIONS_ENDPOINT, ::PivotalTracker::Resource::Iteration)
      end

      def <=>(another_project)
        id <=> another_project.id
      end

      private

      def fetch(endpoint, resource_klass, limit=100)
        client = PivotalTracker::API.build_client
        response = client.get(endpoint, id, { limit: limit })
        raise NoProjectError.new(id) if response.status != 200
        ::JSON.parse(response.body).map do |data|
          resource_klass.new(data)
        end
      end
    end
  end
end

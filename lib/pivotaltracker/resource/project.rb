module PivotalTracker
  module Resource
    class Project
      include Comparable

      attr_reader :id

      def initialize(data)
        @id = data.fetch("id")
      end

      def stories(fields=[])
        fetch(::PivotalTracker::Story::STORIES_ENDPOINT, ::PivotalTracker::Resource::Story, fields)
      end

      def iterations
        fetch(::PivotalTracker::Iteration::ITERATIONS_ENDPOINT, ::PivotalTracker::Resource::Iteration)
      end

      def <=>(another_project)
        id <=> another_project.id
      end

      private

      def fetch(endpoint, resource_klass, fields=[])
        client = PivotalTracker::API.build_client
        response = client.get(endpoint, id)
        raise NoProjectError.new(id) if response.status != 200
        ::JSON.parse(response.body).map do |data|
          resource_klass.new(filtered_data(data, fields))
        end
      end

      def filtered_data(data, fields)
        return data if fields.empty?
        data.select { |field, _| fields.include? field }.merge({ "id" => data.fetch("id") })
      end
    end
  end
end

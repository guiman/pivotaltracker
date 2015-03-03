module PivotalTracker
  module Resource
    class Story
      attr_reader :name, :labels

      def initialize(data)
        @id = data.fetch("id")
        @created_at = data.fetch("created_at", nil)
        @name = data.fetch("name", nil)
        @labels = data.fetch("labels", nil)
      end

      def url
        "https://www.pivotaltracker.com/story/show/#{@id}"
      end

      def created_at
        DateTime.parse(@created_at)
      end
    end
  end
end

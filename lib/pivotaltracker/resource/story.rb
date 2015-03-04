module PivotalTracker
  module Resource
    class Story
      attr_reader :id, :labels

      def initialize(data)
        @id = data.fetch("id")
        @labels = data.fetch("labels", [])
        @accepted_at = data.fetch("accepted_at", nil)
      end

      def url
        "https://www.pivotaltracker.com/story/show/#{id}"
      end

      def accepted_at
        return unless @accepted_at
        DateTime.parse(@accepted_at)
      end
    end
  end
end

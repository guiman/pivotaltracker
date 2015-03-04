module PivotalTracker
  module Resource
    class Story
      attr_reader :id, :labels

      def initialize(data)
        @id = data.fetch("id")
        @labels = data.fetch("labels")
      end
    end
  end
end

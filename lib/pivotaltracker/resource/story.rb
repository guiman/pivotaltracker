module PivotalTracker
  module Resource
    class Story
      def initialize(data)
        @id = data.fetch("id")
      end
    end
  end
end

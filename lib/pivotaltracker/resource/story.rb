module PivotalTracker
  module Resource
    class Story
      InvalidStoryError = Class.new(StandardError)
      ACCEPTED_STATES = %w(accepted delivered finished started rejected planned unstarted unscheduled)

      attr_reader :id, :labels, :current_state

      def initialize(data)
        @id = data.fetch("id")
        @labels = data.fetch("labels", [])
        @accepted_at = data.fetch("accepted_at", nil)
        @current_state = data.fetch("current_state", nil)
        validate_current_state
      end

      def url
        "https://www.pivotaltracker.com/story/show/#{id}"
      end

      def accepted_at
        return unless @accepted_at
        DateTime.parse(@accepted_at)
      end

      private

      def validate_current_state
        return unless @current_state

        unless ACCEPTED_STATES.include? @current_state
          raise InvalidStoryError.new("The state #{@current_state} is invalid")
        end
      end
    end
  end
end

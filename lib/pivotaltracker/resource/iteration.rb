module PivotalTracker
  module Resource
    class Iteration
      attr_reader :project_id

      def initialize(data)
        @project_id = data.fetch("project_id")
      end

      def project
        ::PivotalTracker::Project.find(project_id)
      end
    end
  end
end

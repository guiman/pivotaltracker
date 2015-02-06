module PivotalTracker
  class API

    def project(project_id)
      raise NoProjectError.new(project_id)
    end

    private

    attr_reader :token

    def initialize(token)
      @token = token
    end
  end
end

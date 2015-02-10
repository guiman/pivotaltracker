require 'pivotaltracker/version'
require 'pivotaltracker/api'
require 'pivotaltracker/project'

module PivotalTracker
  NoProjectError = Class.new(StandardError) do
    def initialize(project_id)
      @project_id = project_id
    end

    def inspect
      "No project with id #{@project_id}"
    end
  end
end

begin
  require 'pry'
rescue LoadError
end

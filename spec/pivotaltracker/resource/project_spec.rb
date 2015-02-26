require 'spec_helper'

describe PivotalTracker::Resource::Project do
  include TestApiSetup

  describe "#stories" do
    it "returns a collection of Story objects" do
      setup_api
      project_id = 367813
      project = ::PivotalTracker::Project.find(project_id)

      expect(project.stories).not_to be_empty
      expect(project.stories.first).to be_a(PivotalTracker::Resource::Story)
    end
  end
end

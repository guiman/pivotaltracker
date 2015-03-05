require 'spec_helper'

describe PivotalTracker::Resource::Project do
  include TestApiSetup

  describe "#name" do
    it "returns a string representing the project name" do
      project = PivotalTracker::Resource::Project.new( "id" => 123, "name" => "My project")
      expect(project.name).to eq("My project")
    end
  end

  describe "#stories" do
    it "returns a collection of Story objects" do
      setup_api
      project_id = 367813
      project = ::PivotalTracker::Project.find(project_id)

      expect(project.stories).not_to be_empty
      expect(project.stories.first).to be_a(PivotalTracker::Resource::Story)
    end

    it "returns a collection of Stories with a certain limit" do
      project = described_class.new( "id" => "367813" )
      expect(project.stories(limit: 1).count).to eq(1)
    end
  end

  describe "#iterations" do
    it "returns a collection of Iteration objects" do
      setup_api
      project_id = 367813
      project = ::PivotalTracker::Project.find(project_id)

      expect(project.iterations).not_to be_empty
      expect(project.iterations.first).to be_a(PivotalTracker::Resource::Iteration)
    end
  end
end

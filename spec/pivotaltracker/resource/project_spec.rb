require 'spec_helper'

describe PivotalTracker::Resource::Project do
  include TestApiSetup

  before(:each) do
    setup_api
  end

  let(:project) { ::PivotalTracker::Project.find(367813) }

  describe "#stories" do
    it "returns a collection of Story objects" do
      expect(project.stories).not_to be_empty
      expect(project.stories.first).to be_a(PivotalTracker::Resource::Story)
    end

    it "returns a collection of Story objects with specified fields" do
      fields = [:url, :name]
      stories = project.stories(fields: fields)
      expect(stories).not_to be_empty
      expect(stories.first).to be_a(PivotalTracker::Resource::Story)
    end
  end

  describe "#iterations" do
    it "returns a collection of Iteration objects" do
      expect(project.iterations).not_to be_empty
      expect(project.iterations.first).to be_a(PivotalTracker::Resource::Iteration)
    end
  end
end

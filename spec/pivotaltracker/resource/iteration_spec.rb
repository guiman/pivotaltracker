require 'spec_helper'

describe PivotalTracker::Resource::Iteration do
  describe "#project" do
    it "returns the Project it belongs to" do
      project_id = 367813
      project = ::PivotalTracker::Resource::Project.new({ "id" => project_id })
      iteration = ::PivotalTracker::Resource::Iteration.new({ "project_id" => project_id})

      expect(iteration.project).to eq(project)
    end
  end
end

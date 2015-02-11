require 'spec_helper'

describe PivotalTracker::Project do
  describe ".find" do
    let(:project_id) { 367813 }

    context "project does not exist" do
      it "raises NoProjectError" do
        expect{ described_class.find(-1) }.to raise_error(PivotalTracker::NoProjectError)
      end
    end

    context "project exists" do
      before(:each) do
        PivotalTracker::API.configure do |config|
          config.token = ""
          config.client = PivotalTracker::API::TestClient
        end
      end

      it "returns Project instance" do
        project = PivotalTracker::Project.new(project_id)
        expect(described_class.find(project_id).id).to eq(project.id)
      end
    end
  end
end

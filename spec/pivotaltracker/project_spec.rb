require 'spec_helper'

describe PivotalTracker::Project do
  include TestApiSetup

  let(:project_id) { 367813 }

  describe ".find" do
    context "project does not exist" do
      it "raises NoProjectError" do
        setup_api
        expect{ described_class.find(-1) }.to raise_error(PivotalTracker::NoProjectError)
      end
    end

    context "project exists" do
      it "returns ProjectResource instance" do
        setup_api
        resource = described_class.find(project_id)
        expect(resource).to be_a(PivotalTracker::Resource::Project)
        expect(resource.id).to eq(project_id)
      end
    end
  end
end

require 'spec_helper'

describe PivotalTracker::Project do

  let(:project_id) { 367813 }

  describe ".find" do
    context "project does not exist" do
      it "raises NoProjectError" do
        setup_api
        expect{ described_class.find(-1) }.to raise_error(PivotalTracker::NoProjectError)
      end
    end

    context "project exists" do
      it "returns Project instance" do
        setup_api
        project = PivotalTracker::Project.new(project_id)
        expect(described_class.find(project_id).id).to eq(project.id)
      end
    end
  end

  describe "#stories" do
    it "returns a collection of Story objects" do
      setup_api
      project = described_class.find(project_id)

      expect(project.stories).not_to be_empty
      expect(project.stories.first).to be_a(PivotalTracker::Story)
    end
  end

  private

  def setup_api
    PivotalTracker::API.configure do |config|
      config.token = ""
      config.client = PivotalTracker::API::TestClient
    end
  end
end

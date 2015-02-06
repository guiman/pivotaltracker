require 'spec_helper'

describe PivotalTracker::API do
  let(:token) { "token" }
  let(:api) { described_class.new(token) }

  describe "#project" do
    let(:project_id) { "project_id_123" }
    context "project does not exist" do
      it "raises a PivotalTracker::NoProjectError" do
        expect{ api.project(project_id) }.to raise_exception(PivotalTracker::NoProjectError)
      end
    end
  end
end

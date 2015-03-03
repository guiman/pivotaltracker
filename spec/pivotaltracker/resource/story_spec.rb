require 'spec_helper'

describe PivotalTracker::Resource::Story do
  let(:story) do
    described_class.new("id" => 12345, "created_at" => "2015-02-17T12:00:00Z",
                        "name" => "Story name", "labels" => ["Label 1", "Label 2"])
  end

  it "has url" do
    expect(story.url).to eq("https://www.pivotaltracker.com/story/show/12345")
  end

  it "has creation date" do
    expect(story.created_at).to eq(DateTime.parse("2015-02-17T12:00:00Z"))
  end

  it "has name" do
    expect(story.name).to eq("Story name")
  end

  it "has labels" do
    expect(story.labels).to match_array(["Label 1", "Label 2"])
  end
end

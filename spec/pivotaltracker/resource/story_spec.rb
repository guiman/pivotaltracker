describe PivotalTracker::Resource::Story do
  describe "#labels" do
    it "returns an array of labels" do
      story = described_class.new({ "id"=> "123", "labels" => ["Foo", "Barz"]})
      expect(story.labels).to match_array(["Foo", "Barz"])
    end
  end

  describe "#id" do
    it "returns story ID" do
      story = described_class.new({ "id" => "123", "labels" => [] })
      expect(story.id).to eq("123")
    end
  end
end

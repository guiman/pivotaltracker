describe PivotalTracker::Resource::Story do
  describe "#labels" do
    it "returns an array of labels" do
      story = described_class.new({ "id"=> "123", "labels" => ["Foo", "Barz"]})
      expect(story.labels).to match_array(["Foo", "Barz"])
    end
  end

  describe "#id" do
    it "returns story ID" do
      story = described_class.new({ "id" => "123" })
      expect(story.id).to eq("123")
    end
  end

  describe "#url" do
    it "returns story url" do
      story = described_class.new({ "id" => "123" })
      expect(story.url).to eq("https://www.pivotaltracker.com/story/show/123")
    end
  end

  describe "#accepted_at" do
    it "returns nil if story has not been accepted yet" do
      story = described_class.new({ "id" => "123" })
      expect(story.accepted_at).to be_nil
    end

    it "returns a DateTime value" do
      story = described_class.new({ "id" => "123", "accepted_at" => "2015-02-17T12:00:00Z" })
      expect(story.accepted_at).to eq(DateTime.parse("2015-02-17T12:00:00Z"))
    end
  end
end

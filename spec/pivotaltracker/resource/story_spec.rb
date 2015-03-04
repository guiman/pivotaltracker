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

  describe "#current_state" do
    it "returns a string representing the current state" do
      story = described_class.new({ "id" => "123", "current_state" => "unstarted" })
      expect(story.current_state).to eq("unstarted")
    end

    it "its a valid state" do
      expect do
        described_class.new({ "id" => "123", "current_state" => "Foo" })
      end.to raise_error(PivotalTracker::Resource::Story::InvalidStoryError)
    end
  end
end

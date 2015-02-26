module TestApiSetup
  def setup_api
    PivotalTracker::API.configure do |config|
      config.token = ""
      config.client = PivotalTracker::API::TestClient
    end
  end
end

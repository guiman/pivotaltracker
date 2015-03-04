# PivotalTracker (*.rb)

Pivotal Tracker API v.5 client.

[![Code
Climate](https://codeclimate.com/github/guiman/pivotaltracker/badges/gpa.svg)](https://codeclimate.com/github/guiman/pivotaltracker)
[![Build
Status](https://travis-ci.org/guiman/pivotaltracker.svg)](https://travis-ci.org/guiman/pivotaltracker)
[![Test
Coverage](https://codeclimate.com/github/guiman/pivotaltracker/badges/coverage.svg)](https://codeclimate.com/github/guiman/pivotaltracker)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pivotaltracker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pivotaltracker

## Usage

```
api = PivotalTracker::API.new(configuration) do |config|
  config.token = api_token
end

project = PivotalTracker::Project.find(project_id)

stories = project.stories

story = stories.first

story.labels # => ["label 1", "label 2"]
story.id # "123"

iterations = project.iterations

stories_from_iterations = iterations.first.stories

...

api.reset!
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pivotaltracker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

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

### Set your credentials

```
api = PivotalTracker::API.new(configuration) do |config|
  config.token = api_token
end
```

### Fetch stories and iterations for the project
 
```
project = PivotalTracker::Project.find(project_id)

stories = project.stories

iterations = project.iterations

stories_from_iterations = iterations.first.stories
```

### Fetch only specified fiels for stories

```
stories = project.stories(fields: [:url, :accepted_at, :name])

story = stories.first

story.url # https://www.pivotaltracker.com/story/show/123456

story.accepted_at # 2015-03-03 08:05:55

story.name # My story name

...

api.reset!
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pivotaltracker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

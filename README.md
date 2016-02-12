# Salt API

This is a simple client gem for the Salt API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'salt-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install salt-api

## Usage

Get a list of minions including grains info.

```
require 'salt/api'

Salt::Api.configure do |config|
  config.hostname = "salt.example.com"
  config.username = "user1"
  config.password = "password"
  config.eauth = "ldap"
end

puts Salt::Api.minions
```

```
require 'salt/api'

Salt::Api.run(
  client: 'local',
  tgt: '*',
  fun: 'test.ping'
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jbussdieker/ruby-salt-api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


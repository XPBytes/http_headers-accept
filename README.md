# HttpHeaders::Accept

[![Build Status: master](https://travis-ci.com/XPBytes/http_headers-accept.svg)](https://travis-ci.com/XPBytes/http_headers-accept)
[![Gem Version](https://badge.fury.io/rb/http_headers-accept.svg)](https://badge.fury.io/rb/http_headers-accept)
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

Authorize a certain block with cancan

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'http_headers-accept'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install http_headers-accept

## Usage

### List

There is a utility class for list based headers. The utility parses the header values(s) for you and 
outputs a custom entry class. This can be used for almost any header that allows multiple values, as
per the RFC these are consistent with the exception of the Cookie / Set-Cookie headers (at time of 
writing).

```ruby
require 'http_headers/accept/list'

class ListBasedHeader < Accept::List
  def initialize(value)
    super value, entry_klazz: Entry
  end
  
  class Entry
    def initialize(value, index:, parameters:)
    
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [XPBytes/http_headers-accept](https://github.com/XPBytes/http_headers-accept).

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

You can parse the "Accept" header. As per the RFCs, you should really have one (delimited) value but the current 
implementation accepts an array of values.

```ruby
require 'http_headers/accept'

parsed = HttpHeaders::Accept.new('application/json, text/html; q=0.8')
parsed.first.to_s
# => 'application/json' 
parsed.last.q
# => 0.8
 
 
parsed = HttpHeaders::Accept.new([
  '*/*; q=0.1', 
  'application/json; foo=bar, text/html; q=0.8'
])
parsed.first[:foo]
# => bar
parsed.last.to_s
# => '*/*; q=0.1'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [XPBytes/http_headers-accept](https://github.com/XPBytes/http_headers-accept).

# cook.ie

[![Build
Status](https://travis-ci.org/rsmacapinlac/cook.ie.svg?branch=master)](https://travis-ci.org/rsmacapinlac/cook.ie)

This gem makes cookies. I mean, if cookies were text files derived from erb templates. http://www.macapinlac.com/projects/cook-ie

## Installation

`gem install cook.ie`

## Setup

The gem assumes that you have an environment variable called CC_TEMPLATE_DIR
that has a pointer to a template folder. If it doesn't find one it defaults to

`~/Dropbox/!Templates`

It also expects a `config.yml` file in there to make it a bit smarter.

In the template folder, you have a config.yml file and your template files.

## Usage

Look, it's not done but I mean you can download the code or clone this. Then
figure out how to use it.

`bin/cookie template_name name`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/rsmacapinlac/cook.ie/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

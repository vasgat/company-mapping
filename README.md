# Company::Mapping

Given a Corpus of Company Names and a new (incoming) Company Name, the CompanyMapper class, finds the closest match if exists based on the calculated tf-idf similarity and a defined threshold.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'company-mapping'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install company-mapping

## Usage

```ruby
mapper = Company::Mapping::CompanyMapper.new(companiesCorpus)
puts mapper.map(new_company, 0.5)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vasgat/company-mapping. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


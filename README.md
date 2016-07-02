# UnityXcodePostProcessor

Unityから出したやつのアプリ表示名のローカライズを自動的にやる

検証環境は以下の通り

- ruby
    - 2.3.1

- gems
    - thor (0.19.1)
    - xcodeproj (1.1.0)

- Unity
    - 5.3.4p6

- Xcode
    - 7.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'UnityXcodePostProcessor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install UnityXcodePostProcessor

## Usage

bundle exec exe/UnityXcodePostProcessor localize

サンプルなので適当に書き換えたりしないとだめだと思う

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/furukazu/UnityXcodePostProcessor. 


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


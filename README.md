> **DEPRECATED:** RubyGems now supports publishing to your own server [natively](https://guides.rubygems.org/publishing/#serving-your-own-gems).

# Special Delivery

Special Delivery allows you to use Bundler's rake commands to release gems to your geminabox server. It is heavily inspired by Josh Krueger's [bundler_geminabox](https://github.com/joshkrueger/bundler_geminabox) gem.

## Installation

Crack open your gemspec and add `special_delivery` as a development dependency:

```Ruby
Gem::Specification.new do |gem|
  # ...
  gem.add_development_dependency 'special_delivery'

end
```

And then execute:

    $ bundle

In your gem's Rakefile, replace Bundler's gem tasks with Special Delivery's:

```ruby
require "bundler/gem_tasks"
```

becomes

```ruby
require "special_delivery/gem_tasks"
```

## Usage

Use Special Delivery to release gems just like you would with Bundler:

    $ rake release

The latest version of your gem will be tagged, built and pushed to your geminabox server.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

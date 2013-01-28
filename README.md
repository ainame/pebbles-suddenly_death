# Pebbles::SuddenlyDeath

This module is a joke.

## Installation

Add this line to your application's Gemfile:

    gem 'pebbles-suddenly_death'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pebbles-suddenly_death

## Usage

```ruby
require 'pebbles/suddenly_death'

class Greeter
  def hello
    'hello world'
  end

  include Pebbles::SuddenlyDeath
end

greeter = Greeter.new
1000.times do |x|
  begin
    greeter.hello
  rescue => e
    puts x, e.message
    break
  end
end
#=> 74
#=> ＿人人人人人人＿
#=>＞　突然の死　＜
#=>￣Y^Y^Y^Y^Y￣

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

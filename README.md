# PoroPlus
Friendly methods intended to make POROs more useful.

## Installation

Add this line to your application's Gemfile:

    gem 'poro_plus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install poro_plus

## Usage

Simply include PoroPlus into your Ruby class:

    class MyThing
      include PoroPlus
      attr_reader :foo, :bar, :tres
    end

Then you can:

    > thing_1 = MyThing.new(:foo => 'Raven', :bar => 'Writing Desk', :tres => nil)
    => #<MyThing:0x007ff4866ea398 @foo="Raven", @bar="Writing Desk", @tres=nil>

    > thing_1.to_hash
    => {:foo=>"Raven", :bar=>"Writing Desk", :tres=>nil}

    > thing_one.to_json(:skip_nils => true)
     => "{\"foo\":\"Raven\",\"bar\":\"Writing Desk\"}"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

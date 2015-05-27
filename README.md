# PipedrivePUT

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'PipedrivePUT'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install PipedrivePUT

## Usage

   PipedrivePUT.key(< API Token Here >)

## Organizations

Get all organizations from your account at Pipedrive

```ruby
  PipedrivePUT.getAllOrgs
```

Add an organization

```ruby
  PipedrivePUT.addOrganization(< Name of new Organization >)
```

##Search

Search entire Pipedrive (Deals, Organizations, Product, File, Person)

```ruby
  PipedrivePUT.search(< Term >)
```

Search Specific Item type in Pipedrive (Deals, Organizations, Product, File, Person)

```ruby
  PipedrivePUT.search(< Term >, < item_type>)
```

Example:

```ruby
  PipedrivePUT.search("UPMC", "organization")
```

Data is returned in JSON format.

This can be easily customized. I needed something quickly and easily for my own personal project.

This is my first attempt at a ruby gem so I appoligize if things are unorthodox.

## To do List

1. Add search for specific organization id

2. Add support for additional arguments to create an organization

3. Deals


## Contributing

1. Fork it ( https://github.com/[my-github-username]/PipedrivePUT/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

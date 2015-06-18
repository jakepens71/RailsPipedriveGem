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
  PipedrivePUT::Organizations.getAllOrgs
```

Get Organization by ID
```ruby
  PipedrivePUT::Organizations.getOrganization(< id >)
```


Add an organization

```ruby
  PipedrivePUT::Organizations.addOrganization(< Name of new Organization >)
```

You can also add various other parameters based on values in Pipedrive or custom keys when creating a organization!


```ruby
  PipedrivePUT::Organizations.addOrganization(< Name of new Organization >, < :optionArgument => "value" > )
```

NOTE: the options must be in hash format

Example:

```ruby
  PipedrivePUT::Organizations.addOrganization("Jacob Programming Test", :address => "South Jasmine Street")
```

You can aso add ANY custom key from Pipedrive to this to input values into those fields

Example:

```ruby
  PipedrivePUT::Organizations.addOrganization("Jacob Programming Test", :'3df8474115f948137b3f98a0ff651d0edbbd2f54' => "JMD")
```

Find Organization by term

```ruby
  PipedrivePUT::Organizations.findOrganizationByName(< Term >)
```

Find Persons in an Organization
```ruby
  PipedrivePUT::Organizations.getPersonsOfOrganization(< id >)
```


## Deals

Get Specific Deal with ID

```ruby
  PipedrivePUT::Deal.getDeal(<id>)
```

Get All Deals

```ruby
PipedrivePUT::Deal.getAllDeals
```

## Search

Search entire Pipedrive (Deals, Organizations, Product, File, Person)

```ruby
  PipedrivePUT::Search.search(< Term >)
```

Search Specific Item type in Pipedrive (Deals, Organizations, Product, File, Person)

```ruby
  PipedrivePUT::Search.search(< Term >, < item_type>)
```

Example:

```ruby
  PipedrivePUT::Search.search("UPMC", "organization")
```

## Users

Get All users for your company

```ruby
  PipedrivePUT::Users.getAllUsers
```

## Persons

Get all persons from Pipedrive
```ruby
  PipedrivePUT::Persons.getAllPersons
```

Get specifi Person from Pipedrive

```ruby
  PipedrivePUT::Persons.detailsOfPerson(< id >)
```

## Pipelines

Get all Pipelines
```ruby
  PipedrivePUT::Pipelines.getAllPipelines
```

Get one Pipeline
```ruby
  PipedrivePUT::Pipelines.getOnePipeline(< id >)
```


Data is returned in JSON format.

This can be easily customized. I needed something quickly and easily for my own personal project.

This is my first attempt at a ruby gem so I appoligize if things are unorthodox.

## To do List


1. Add support for additional arguments when creating a deal

2. Many other Pipedrive API Calls


## Contributing

1. Fork it ( https://github.com/jakepens71/RailsPipedriveGem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

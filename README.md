# PipedrivePUT

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'PipedrivePUT'
```

#Needed for some http commands.

```ruby
gem 'httparty'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install PipedrivePUT

## Usage

```ruby
   PipedrivePUT.key(< API Token Here >)
```

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
  PipedrivePUT::Organizations.addOrganization("Jacob Programming Test", :'3df8474115f948137b3f98a0ff651d0edbbd2f54' => "JMD", :address => "South Jasmine Street")
```

Find Organization by term

```ruby
  PipedrivePUT::Organizations.findOrganizationByName(< Term >)
```

Find Persons in an Organization
```ruby
  PipedrivePUT::Organizations.getPersonsOfOrganization(< id >)
```

Update an organization
```ruby
  PipedrivePUT::Organizations.updateOrganization(< id >, < optional params >)
```
Example
```ruby
  PipedrivePUT::Organizations.updateOrganization(1, :name => "New Organization Name")
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
  PipedrivePUT::Search.search(< Term >, < item_type >)
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

Add a person to Pipedrive

```ruby
  PipedrivePUT::Persons.addPerson(< Name of Person >, < additional params >)
```

Example:

```ruby
  PipedrivePUT::Persons.addPerson("Programming Test Person", {:org_id => 15367, :phone => [{:value=>'555-555-3340',:label=>'work'},{:value=>'555-111-1111',:label=>'home'}]})
```

NOTE: The option arguments do not be put in as strings. As of right now that is not working in irb console. I will attempt to see if that plays a factor in rails its self.

Delete a persons from Pipedrive

```ruby
  PipedrivePUT::Persons.deletePerson(< id >)
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

## Recents

Get all Recent changes from Pipedrive based on a specific time
```ruby
  PipedrivePUT::Recents.getRecent(< Time.now >)
```

## Organization Fields

Get all fields that are able to be used in an organization
```ruby
  PipedrivePUT::OrganizationFields.getAllOrganizationFields
```


NOTE: This searches for everything in Pipedrive (deal, organization, user, state, product, etc.) 

I hope to add additional support to break this down at a later time.


Data is returned in JSON format.

This can be easily customized. I needed something quickly and easily for my own personal project.

This is my first attempt at a ruby gem so I appoligize if things are unorthodox.

The Pipedrive API can be found at:
https://developers.pipedrive.com/v1

## To do List


1. Add support for additional arguments when creating a deal

2. Add ability to search for recent changes by specific types onle (deal, organization, user, state, etc.)

3. Many other Pipedrive API Calls


## Contributing

1. Fork it ( https://github.com/jakepens71/RailsPipedriveGem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

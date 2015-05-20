require "PipedrivePUT/version"

require 'json'
require 'open-uri'

module PipedrivePUT
  
	def self.key(key)
	   @key = key	  
	end

	def self.getKey
	  return @key
	end

	def self.getDeal(id)
	  @base = 'https://api.pipedrive.com/v1/deals/' + id.to_s + '?api_token=' + @key.to_s
	  @content = open(@base.to_s)
	  JSON.parse(@response)
	end


       def self.getAllOrgs()
	  
	  @start = 0
          
	  table = Array.new
	  @more_items = true

	  while @more_items == true do
		puts @more_items
		@base = 'https://api.pipedrive.com/v1/organizations?start=' + @start.to_s + '&limit=500&api_token=' + @key.to_s
		puts @base
		@content = open(@base.to_s).read
		@parsed = JSON.parse(@content)
		@data = @parsed["data"]
		
		table.push(@data)

		@pagination = @parsed['additional_data']['pagination']
		@more_items = @pagination['more_items_in_collection']
		puts @more_items
		@start = @pagination['next_start']
		puts @start
          end

	return table
	end

end

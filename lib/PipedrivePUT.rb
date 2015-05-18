require "PipedrivePUT/version"

require 'rest-client'
require 'json'

module PipedrivePUT
  
	def self.key(key)
	   @key = key	  
	end

	def self.getKey
	  return @key
	end

	def self.getDeal(id)
	  @base = 'https://api.pipedrive.com/v1/deals/' + id.to_s + '?api_token=' + @key.to_s
	  @response = RestClient.get @base.to_s, {:accept => :json}
	  JSON.parse(@response)
	end


       def self.getAllOrgs()
	  
	  @start = 0
          

	  @more_items = true
	  @newData = ""

	  while @more_items == true do
		#puts @more_items
		@base = 'https://api.pipedrive.com/v1/organizations?start=' + @start.to_s + '&limit=500&api_token=' + @key.to_s
		#puts @base
		@response = RestClient.get @base.to_s, {:accept => :json }
		@data = JSON.parse(@response)
		@newData = @newData + @response
		@pagination = @data['additional_data']['pagination']
		@more_items = @pagination['more_items_in_collection']
		#puts @more_items
		@start = @pagination['next_start']
		#puts @start
          end

	return @newData

	end

end

require "PipedrivePUT/version"

require 'json'
require 'open-uri'
require 'rest-client'

module PipedrivePUT
  	#set the giving API key for pipedrive
	def self.key(key)
	   @key = key	  
	end
	
	#See which key is givin
	def self.getKey
	  return @key
	end


	#Return data of a specific deal
	def self.getDeal(id)
	  @base = 'https://api.pipedrive.com/v1/deals/' + id.to_s + '?api_token=' + @key.to_s
	  @content = open(@base.to_s).read
	  @parsed = JSON.parse(@content)
	  return @parsed
	end

	#Get All Organizations from Pipedrive
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

	#Add an organization
	def self.addOrganization(name, *args)
		args.each_with_index{ |arg, i| puts "#{i+1}. #{arg}" } 

		if (args.size > 3)
			raise "Only takes four Params (<Organization Name>, <Owner ID>, <Visible_to> (1-Owner & followers(private) 3-Entire Company)"
		end

		@base = 'https://api.pipedrive.com/v1/organizations?api_token=' + @key.to_s

		

		#RestClient.post @base.to_s, { "name" => "Jacob Programming Test" }.to_json, :content_type => :json, :accept => :json
	
	end

end

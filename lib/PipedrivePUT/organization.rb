module PipedrivePUT
  class Organizations

include PipedrivePUT

require 'httparty'

require 'rest-client'
			def self.key
			 puts @@key
			end

		#Get All Organizations from Pipedrive
		       def self.getAllOrgs()
			  
			  @start = 0
			  
			  table = Array.new
			  @more_items = true
			  tablesize = 0
			  while @more_items == true do
				count = 0
				#puts @more_items
				@base = URI.parse('https://api.pipedrive.com/v1/organizations?start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s)
				#puts @base
				@content = Net::HTTP.get(@base.to_s)
				@parsed = JSON.parse(@content)

				while count < @parsed["data"].size
					#table.push(@parsed["data"][count])
					table[tablesize] = @parsed["data"][count]
					count = count +1
					tablesize = tablesize + 1
				end

				@pagination = @parsed['additional_data']['pagination']
				@more_items = @pagination['more_items_in_collection']
				#puts @more_items
				@start = @pagination['next_start']
				#puts @start
			  end

			return table
			end


			#Add an organization
			def self.addOrganization(companyName, options = {})
				#args.each_with_index{ |arg, i| puts "#{i+1}. #{arg}" } 

				uri = URI.parse('https://api.pipedrive.com/v1/organizations?api_token=' + @@key.to_s)

				if (!options.nil?)

					options.merge!(:name => companyName)

					puts options

					response = Net::HTTP.post_form(uri, options)
				end
			end

			#Return data of a specific Organization
			def self.getOrganization(id)
				@base = 'https://api.pipedrive.com/v1/organizations/' + id.to_s + '?api_token=' + @@key.to_s
				@content = open(@base.to_s).read
				@parsed = JSON.parse(@content)
				return @parsed
			end

			#Find Organization by name
			def self.findOrganizationByName(name)
				@start = 0
			  
				table = Array.new
				@more_items = true
				tablesize = 0

				while @more_items == true do
					count = 0

					@base = URI.parse('https://api.pipedrive.com/v1/organizations/find?term=' + name+ '&start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s)
						
					puts @base

					@content = open(@base.to_s).read

					puts @content

					@parsed = JSON.parse(@content)	
				
						while count < @parsed["data"].size
							#table.push(@parsed["data"][count])
							table[tablesize] = @parsed["data"][count]
							count = count +1
							tablesize = tablesize + 1
					
						end	
					@pagination = @parsed['additional_data']['pagination']
					@more_items = @pagination['more_items_in_collection']
					#puts @more_items
					@start = @pagination['next_start']
					#puts @start
			  	end
				return table
			end
			

			#Get Persons of an Organization
			def self.getPersonsOfOrganization(id)
				@start = 0
			  
				table = Array.new
				@more_items = true
				tablesize = 0

				while @more_items == true do
					count = 0

					@base = 'https://api.pipedrive.com/v1/organizations/' + id.to_s + '/persons?&start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s
										
					@content = open(@base.to_s).read
					@parsed = JSON.parse(@content)

					if @parsed["data"].nil?
						return "Organization does not have any Person associated with it"
					else
				
							while count < @parsed["data"].size
								#table.push(@parsed["data"][count])
								table[tablesize] = @parsed["data"][count]
								count = count +1
								tablesize = tablesize + 1
					
							end	
						@pagination = @parsed['additional_data']['pagination']
						@more_items = @pagination['more_items_in_collection']
						#puts @more_items
						@start = @pagination['next_start']
						#puts @start
					end
			  	end
				return table
			end

			#Update an Organization
			def self.updateOrganization(id, options = {})
				@url = 'https://api.pipedrive.com/v1/organizations/' + id.to_s + '?api_token=' + @@key.to_s

				#puts @url
				
				if (!options.nil?)
					
					options.merge!(:id => id)
					#puts options

					#puts '----------------------'
					
					response = HTTParty.put(@url.to_s, :body => options.to_json, :headers => {'Content-type' => 'application/json'})
					#puts '----------------------'
					#puts response				
	
				end

			end

   end
end
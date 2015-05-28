module PipedrivePUT
  class Organizations

include PipedrivePUT


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
				@base = 'https://api.pipedrive.com/v1/organizations?start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s
				#puts @base
				@content = open(@base.to_s).read
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
			#TO DO: Add optional *args full functionality
			def self.addOrganization(name, *args)
				args.each_with_index{ |arg, i| puts "#{i+1}. #{arg}" } 

				if (args.size > 1)
					raise "Only takes one additional Params (<Organization Name>, <Owner ID>)"
				end

				@base = 'https://api.pipedrive.com/v1/organizations?api_token=' + @@key.to_s

		
				RestClient.post @base.to_s, { "name" => name }.to_json, :content_type => :json, :accept => :json
	
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

					@base = 'https://api.pipedrive.com/v1/organizations/find?term=' + name.to_s + '&start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s
										
					@content = open(@base.to_s).read
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
			


   end
end
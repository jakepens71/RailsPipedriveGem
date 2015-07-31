module PipedrivePUT

require 'httparty'

	class Persons
		include PipedrivePUT

		#Gets all persons in pipedrive
		def self.getAllPersons
			@start = 0
			  
				  table = Array.new
				  @more_items = true
				  tablesize = 0
				  while @more_items == true do
					count = 0
					#puts @more_items
					@base = 'https://api.pipedrive.com/v1/persons?start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s
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


		#Gets details of a signle person with id being passed in at params.
		def self.detailsOfPerson(id)
				@base = 'https://api.pipedrive.com/v1/persons/' + id.to_s + '?start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s
				@content = open(@base.to_s).read
				@parsed = JSON.parse(@content)

		end

		#Add an Person
			def self.addPerson(name, options = {})
				#args.each_with_index{ |arg, i| puts "#{i+1}. #{arg}" } 

				@url = 'https://api.pipedrive.com/v1/persons?api_token=' + @@key.to_s

				if (!options.nil?)

					options.merge!(:name => name)

					puts options

					response = HTTParty.post(@url.to_s, :body => options.to_json, :headers => {'Content-type' => 'application/json'})
				end
			end

		#Delete a person from Pipedrive
			def self.deletePerson(id)

				@url = 'https://api.pipedrive.com/v1/persons/' + id.to_s + '?api_token=' + @@key.to_s

				response = HTTParty.delete(@url.to_s)
			end


		#Update an Organization
			def self.updatePerson(id, options = {})
				@url = 'https://api.pipedrive.com/v1/persons/' + id.to_s + '?api_token=' + @@key.to_s
				
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
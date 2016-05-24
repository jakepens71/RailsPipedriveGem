module PipedrivePUT
  class Organizations

include PipedrivePUT

require 'httparty'

require 'rest-client'
			def self.key
			 return @@key
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
						@content = Net::HTTP.get(@base)
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
			def self.addOrganization(company_name, options = {})
				uri = "https://api.pipedrive.com/v1/organizations?api_token=#{@@key}"
				options = options.merge(name: company_name)
        HTTParty.post(uri, body: options.to_json, headers: {'Content-type' => 'application/json'})
			end

			#Return data of a specific Organization
			def self.getOrganization(id)
				begin
					@base = 'https://api.pipedrive.com/v1/organizations/' + id.to_s + '?api_token=' + @@key.to_s
					@content = open(@base.to_s).read
					@parsed = JSON.parse(@content)
					if @parsed["data"].nil?
							return "Organization does not exist in pipedrive"
					else
						return @parsed
					end
				rescue OpenURI::HTTPError => error
					response = error.io
					return response.status
				end
			end

      # Find Organization by name
      def self.findOrganizationByName(name, options = {})
        params = {}

        params[:start]     = options.fetch(:start, 0)
        params[:limit]     = options.fetch(:limit, 500)
        params[:api_token] = @@key.to_s

        url = "https://api.pipedrive.com/v1/organizations/find?term=#{name}"

        params.each do |key, value|
          url << "&#{key}=#{value}"
        end

        begin
          table = []
          more_items = true
          tablesize = 0

          while more_items == true
            count = 0

            content = open(url).read
            parsed = JSON.parse(content)
            return table if parsed['data'].nil?

            while count < parsed['data'].size
              table[tablesize] = parsed['data'][count]
              count += 1
              tablesize += 1
            end
            pagination     = parsed['additional_data']['pagination']
            more_items     = pagination['more_items_in_collection']
            params[:start] = pagination['next_start']
          end
          return table
        rescue OpenURI::HTTPError => error
          response = error.io
          return response.status
        end
      end


			#Get Persons of an Organization
			def self.getPersonsOfOrganization(id)
				begin
					@start = 0

					table = Array.new
					@more_items = true
					tablesize = 0

					while @more_items == true do
						count = 0

						@base = 'https://api.pipedrive.com/v1/organizations/' + id.to_s + '/persons?&start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s

						@content = open(@base.to_s).read

						puts @content

						@parsed = JSON.parse(@content)

						if @parsed["data"].nil?
							return "Organization does not have any Person associated with that id"
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
				rescue OpenURI::HTTPError => error
					response = error.io
					return response.status
				end
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

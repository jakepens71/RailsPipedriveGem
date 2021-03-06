module PipedrivePUT
  # Operations from the Persons API
  class Persons
    include PipedrivePUT

    # Gets all persons in pipedrive
    def self.getAllPersons
			@start = 0

		  table = Array.new
		  @more_items = true
		  tablesize = 0
		  while @more_items == true do
			count = 0
			@base = 'https://api.pipedrive.com/v1/persons?start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s
			@content = open(@base.to_s).read
			@parsed = JSON.parse(@content)

			while count < @parsed["data"].size
				table[tablesize] = @parsed["data"][count]
				count = count +1
				tablesize = tablesize + 1
			end

			@pagination = @parsed['additional_data']['pagination']
			@more_items = @pagination['more_items_in_collection']
			@start = @pagination['next_start']
    end

			return table
		end

    #Gets details of a signle person with id being passed in at params.
    def self.detailsOfPerson(id)
			url = "https://api.pipedrive.com/v1/persons/#{id}&api_token=#{@@key.to_s}"
      content = open(url).read
			JSON.parse(content)
		end

		#Add an Person
		def self.addPerson(name, options = {})
			url = "https://api.pipedrive.com/v1/persons?api_token=#{@@key.to_s}"

			HTTParty.post(
        url,
        body: options.merge(name: name).to_json,
        headers: {'Content-type' => 'application/json'}
      )
		end

		#Delete a person from Pipedrive
		def self.deletePerson(id)
      url = "https://api.pipedrive.com/v1/persons/#{id}?api_token=#{@@key}"
			HTTParty.delete(url)
		end


		#Update a Person
		def self.updatePerson(id, options = {})
      url = "https://api.pipedrive.com/v1/persons/#{id}?api_token=#{@@key}"

			HTTParty.put(
        url,
        body: options.merge(id: id).to_json,
        headers: {'Content-type' => 'application/json'}
      )
		end

 		# Search person by name
    # term - Search term to look for
    # optional parameters:
    # org_id - ID of the organization person is associated with.
    # start - Pagination start
    # limit - Items shown per page
    # search_by_email (boolean) - when enabled, term will only be matched against email addresses
    # of people. Default: false
    def self.searchForPerson(term, options = {})
      table = []
      more_items = true

      tablesize = 0
      params = {}

      # optional search parameters
      params[:term]            = term if term && !term.empty?
      params[:start]           = options.fetch(:start, 0)
      params[:org_id]          = options.fetch(:org_id, nil) if params[:org_id]
      params[:limit]           = options.fetch(:limit, 500)
      params[:search_by_email] = options.fetch(:search_by_email, 0)
      params[:api_token]       = @@key.to_s

      url = "https://api.pipedrive.com/v1/persons/find?#{URI.encode_www_form(params)}"

      while more_items == true
        count = 0

        parsed = HTTParty.get(url)
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
      table
    end
  end
end

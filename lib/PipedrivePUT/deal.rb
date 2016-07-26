module PipedrivePUT
	class Deal

    include PipedrivePUT
		# Return data of a specific deal
		def self.getDeal(id)
		  @base = 'https://api.pipedrive.com/v1/deals/' + id.to_s + '?api_token=' + @@key.to_s
		  @content = open(@base.to_s).read
		  @parsed = JSON.parse(@content)
		  return @parsed
		end

		def self.getAllDeals
		  @start = 0

			table = Array.new
			@more_items = true
			tablesize = 0
			while @more_items == true do
			  count = 0
			  @base = 'https://api.pipedrive.com/v1/deals?start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s
			  @content = open(@base.to_s).read
			  @parsed = JSON.parse(@content)

			  while count < @parsed["data"].size
			  	table[tablesize] = @parsed["data"][count]
			  	count = count +1
			  	tablesi  ze = tablesize + 1
			  end

			  @pagination = @parsed['additional_data']['pagination']
			  @more_items = @pagination['more_items_in_collection']
			  @start = @pagination['next_start']
      end
		  return table
	  end

  	# Search deal by name
    # term - Search term to look for
    # optional parameters:
    # person_id - ID of the person the deal is associated with.
    # org_id - ID of the organization the deal is associated with.
    # start - Pagination start
    # limit - Items shown per page
    def self.searchForDeal(term, options = {})
      table = []
      more_items = true

      tablesize = 0
      params = {}

      # optional search parameters
      params[:term]            = term if term && !term.empty?
      params[:start]           = options.fetch(:start, 0)
      params[:person_id]       = options.fetch(:person_id, nil) if params[:person_id]
      params[:org_id]          = options.fetch(:org_id, nil) if params[:org_id]
      params[:limit]           = options.fetch(:limit, 500)
      params[:api_token]       = @@key.to_s

      url = "https://api.pipedrive.com/v1/deals/find?#{URI.encode_www_form(params)}"

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
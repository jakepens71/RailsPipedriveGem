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
			  	tablesize = tablesize + 1
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

    # id (required) - ID of the deal
    # title - Deal title
    # value - Value of the deal
    # currency - Currency of the deal. Accepts a 3-character currency code
    # user_id - ID of the user who will be marked as the owner of this deal
    # person_id - ID of the person this deal will be associated with
    # org_id - ID of the organization this deal will be associated with
    # stage_id - ID of the stage this deal will be placed in a pipeline (note that you can't supply the ID of the pipeline as this will be assigned automatically based on stage_id)
    # status - open = Open, won = Won, lost = Lost, deleted = Deleted
    # lost_reason - Optional message about why the deal was lost (to be used when status=lost)
    def self.updateDeal(id, options = {})
      url = "https://api.pipedrive.com/v1/deals/#{id}?api_token=#{@@key}"

      response = HTTParty.put(
        url,
        body: options.to_json,
        headers: { 'Content-type' => 'application/json' }
      )
    end
  end
end

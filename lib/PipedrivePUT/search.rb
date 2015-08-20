module PipedrivePUT
	class Search
		
	include PipedrivePUT


		def self.key
			return @@key
		end


		#Search Pipedrive
		def self.search(term, *args) 
		  @start = 0

		  
		  
		  if (args.size > 1)
		  
			raise "Please only specify one item type (deal, organization, person, product, file)"
			return
		  end
		  

		 if (args.size == 1)
		   #Search through specific Item
			table = Array.new
			  @more_items = true

			  @item_type = args[0].downcase 

			  while @more_items == true do
				count = 0
				@base = 'https://api.pipedrive.com/v1/searchResults?term=' + term.to_s + '&item_type=' + @item_type.to_s + '&start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s

				#puts @base

				@content = open(@base.to_s).read

				#puts @content		

				@parsed = JSON.parse(@content)


				while count < @parsed["data"].size
					table.push(@parsed["data"][count])
					count = count +1
				end

				@pagination = @parsed['additional_data']['pagination']
				@more_items = @pagination['more_items_in_collection']
				#puts @more_items
				@start = @pagination['next_start']
				#puts @start
			end 
			return table
		 
		 else

		   #Search through every item type
			  table = Array.new
			  @more_items = true

			  while @more_items == true do
				@base = 'https://api.pipedrive.com/v1/searchResults?term=' + term.to_s + '&start=' + @start.to_s + '&limit=500&api_token=' + @@key.to_s
				count = 0
				#puts @base

				@content = open(@base.to_s).read

				#puts @content		

				@parsed = JSON.parse(@content)

				while count < @parsed["data"].size
					table.push(@parsed["data"][count])
					count = count +1
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



end
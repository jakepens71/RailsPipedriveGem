module PipedrivePUT
	class Deal
		include PipedrivePUT

			#Return data of a specific deal
			def self.getDeal(id)
			  @base = 'https://api.pipedrive.com/v1/deals/' + id.to_s + '?api_token=' + @@key.to_s
			  @content = open(@base.to_s).read
			  @parsed = JSON.parse(@content)
			  #return @parsed
			end


	end

end
module PipedrivePUT
	class Users
		include PipedrivePUT

			#Get All Users for organization.
			#Might have to loop through such as uptop if have more than what comes in.
			def self.getAllUsers
				@base = 'https://api.pipedrive.com/v1/users?api_token=' + @@key.to_s

				@content = open(@base.to_s).read
				@parsed = JSON.parse(@content)
				return @parsed["data"]
			end


	end

end
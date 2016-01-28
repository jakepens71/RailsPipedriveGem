module PipedrivePUT
  class Activity
    include PipedrivePUT

#----------------------------------------- Gets activites of a specific user----------------------------------------------------------
    def self.getActivity(user_id)
      @base = 'https://api.pipedrive.com/v1/activities?user_id=' + user_id.to_s + '&api_token=' + @@key.to_s
      #puts @base
      @content = open(@base.to_s).read
      @parsed = JSON.parse(@content)
      return @parsed
    end
#-------------------------------------------------------------------------------------------------------------------------------------
  end
end


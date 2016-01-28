module PipedrivePUT
  class ActivityType
    include PipedrivePUT


#----------------------------------------- Gets all activity types ------------------------------------------------------------------
    def self.getActivity_type
      @base = 'https://api.pipedrive.com/v1/activityTypes?api_token=' + @@key.to_s
      #puts @base
      @content = open(@base.to_s).read
      @parsed = JSON.parse(@content)
      return @parsed
    end
#-------------------------------------------------------------------------------------------------------------------------------------
  end
end

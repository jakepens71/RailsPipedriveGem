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
#------------------------------------------------------------------------------------------------------------------------------------

#----------------------------------------- Gets activites of a specific organization------------------------------------------------

    def self.getOrgActivities(org_id)
      @slash = "/"
      @base = 'https://api.pipedrive.com/v1/organizations/' + org_id.to_s + @slash + 'activities?start=0' + '&api_token=' + @@key.to_s
      #puts @base
      @content = open(@base.to_s).read
      @parsed = JSON.parse(@content)
      return @parsed
    end
#-----------------------------------------------------------------------------------------------------------------------------------

    #  subject (required) (string) Subject of the activity
    #  done    (optional) (enumerated) Whether the activity is done or not. 0 = Not done, 1 = Done
    #  type (required) (string) Type of the activity. This is in correlation with the key_string parameter of ActivityTypes.
    #  due_date (optional) (date) Due date of the activity. Format: YYYY-MM-DD
    #  due_time (optional) (time) Due time of the activity in UTC. Format: HH:MM
    #  duration (optional) (time) Duration of the activity. Format: HH:MM
    #  user_id (optional) (number) ID of the user whom the activity will be assigned to. If omitted, the activity will be assigned to the authorized user.
    # deal_id (optional) (number) ID of the deal this activity will be associated with
    # person_id (optional) (number) ID of the person this activity will be associated with
    # org_id (optional) (number) ID of the organization this activity will be associated with
    # note (optional) (string) Note of the activity (HTML format)
    def self.addActivity(subject, type, options = {})
    end
  end
end


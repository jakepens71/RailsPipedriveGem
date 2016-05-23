module PipedrivePUT
  class Activity
    include PipedrivePUT

#----------------------------------------- Gets activites of a specific user----------------------------------------------------------
    def self.getActivity(user_id)
      base = "https://api.pipedrive.com/v1/activities?user_id=#{user_id}&api_token=#{@@key}"
      content = open(base).read
      JSON.parse(content)
    end
#------------------------------------------------------------------------------------------------------------------------------------

#----------------------------------------- Gets activites of a specific organization------------------------------------------------

    def self.getOrgActivities(org_id)
      base = "https://api.pipedrive.com/v1/organizations/#{org_id}/activities?start=0&api_token=#{@@key}"
      content = open(base).read
      JSON.parse(content)
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
      url = "https://api.pipedrive.com/v1/activities?api_token=#{@@key}"

      options['subject'] = subject
      options['type']    = type

      HTTParty.post(url, body: options.to_json, headers: {'Content-type' => 'application/json'})
    end
  end
end


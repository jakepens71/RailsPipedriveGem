module PipedrivePUT
  class DealFields
  include PipedrivePUT

  #---------------------------------------------------Get all deal fields----------------------------------------------------------
    def self.getAllDealFields
      base = "https://api.pipedrive.com/v1/dealFields?api_token=#{@@key}"
      content = open(base).read
      JSON.parse(content)
    end
  #--------------------------------------------------------------------------------------------------------------------------------
  end
end

module PipedrivePUT
  class Filters
    include PipedrivePUT

    def self.getFilters
      base = "https://api.pipedrive.com/v1/filters?api_token=#{@@key}"
      content = open(base).read
      JSON.parse(content)
    end 
  end 
end 

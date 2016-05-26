module PipedrivePUT
  class Files
    include PipedrivePUT

    def self.getAllFiles
      base = "https://api.pipedrive.com/v1/files?start=0&sort=file_name&api_token=#{@@key}"
      content = open(base).read
      JSON.parse(content)
    end 


    def self.downloadFile(file_id)
      file = "https://api.pipedrive.com/v1/files/#{file_id}/download?api_token=#{@@key}"
      base = "https://api.pipedrive.com/v1/files/#{file_id}?api_token=#{@@key}"
      content = open(base).read
      p_data = JSON.parse(content)
      #get_file_name = p_data[
      #open(base, 'wb') do |d_file|
    end
  end
end

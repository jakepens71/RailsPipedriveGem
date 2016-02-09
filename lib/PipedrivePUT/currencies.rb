module PipedrivePUT
  class Currencies
    include PipedrivePUT

#---------------------------------------------------------get all currencies----------------------------------------------------------------------------------------------------------------------
    def self.getAllCurr
      @base = 'https://api.pipedrive.com/v1/currencies?api_token=' + @@key.to_s
      @content = open(@base.to_s).read
      @parsed = JSON.parse(@content)
      return @parsed
    end 
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#----------------------------------------- search for currencies -----------------------------------------------------------------------------------------------------------------------------------
    def self.getCurr(currency_name)
      curr_string = currency_name.to_s 
      curr_string_count = curr_string.split.size
      if curr_string_count <= 1 
        @words = curr_string.split.each_slice(1).map {|a| a.join ' '}
        @first = @words[0]
        @base = 'https://api.pipedrive.com/v1/currencies?term=' + @first.to_s + '&api_token=' + @@key.to_s
        @content = open(@base.to_s).read
        @parsed = JSON.parse(@content)
        return @parsed
      elsif curr_string_count <= 2
        @words = curr_string.split.each_slice(1).map {|a| a.join ' '}
        @first = @words[0]
        @second = @words[1]
        @base = 'https://api.pipedrive.com/v1/currencies?term=' + @first.to_s + '%20' + @second.to_s + '&api_token=' + @@key.to_s
        @content = open(@base.to_s).read
        @parsed = JSON.parse(@content)
        return @parsed
      elsif curr_string_count <= 3
        @words = curr_string.split.each_slice(1).map {|a| a.join ' '}
        @first = @words[0]
        @second = @words[1]
        @third = @words[2]
        @base = 'https://api.pipedrive.com/v1/currencies?term=' + @first.to_s + '%20' + @second.to_s + '%20' + @third.to_s + '&api_token=' + @@key.to_s
        @content = open(@base.to_s).read
        @parsed = JSON.parse(@content)
        return @parsed
      elsif curr_string_count <= 4
        @words = curr_string.split.each_slice(1).map {|a| a.join ' '}
        @first = @words[0]
        @second = @words[1]
        @third = @words[2]
        @fourth = @words[3]
        @base = 'https://api.pipedrive.com/v1/currencies?term=' + @first.to_s + '%20' + @second.to_s + '%20' + @third.to_s + '%20' + @fourth.to_s + '&api_token=' + @@key.to_s
        @content = open(@base.to_s).read
        @parsed = JSON.parse(@content)
        return @parsed
      elsif curr_string_count <= 5
        @words = curr_string.split.each_slice(1).map {|a| a.join ' '}
        @first = @words[0]
        @second = @words[1]
        @third = @words[2]
        @fourth = @words[3]
        @fifth = @words[4]
        @base = 'https://api.pipedrive.com/v1/currencies?term=' + @first.to_s + '%20' + @second.to_s + '%20' + @third.to_s + '%20' + @fourth.to_s + '%20' + @fifth.to_s + '&api_token=' + @@key.to_s
        @content = open(@base.to_s).read
        @parsed = JSON.parse(@content)
        return @parsed
      end 
    end
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  end
end



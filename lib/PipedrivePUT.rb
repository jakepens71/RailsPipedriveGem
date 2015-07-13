require "PipedrivePUT/version"
require "PipedrivePUT/organization"
require 'PipedrivePUT/search'
require 'PipedrivePUT/users'
require 'PipedrivePUT/deal'
require 'PipedrivePUT/persons'
require 'PipedrivePUT/pipelines'
require 'PipedrivePUT/recents'
require 'PipedrivePUT/organization_field'

require 'json'
require 'open-uri'
require 'rest-client'


module PipedrivePUT

	attr_accessor :key

  	#set the giving API key for pipedrive
	def self.key(key)
	   @@key = key	  
	end
	
	#See which key is givin
	def self.getKey
	  @@key
	end

end

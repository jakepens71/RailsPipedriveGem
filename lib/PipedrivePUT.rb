require 'PipedrivePUT/version'
require 'PipedrivePUT/organization'
require 'PipedrivePUT/search'
require 'PipedrivePUT/users'
require 'PipedrivePUT/deal'
require 'PipedrivePUT/persons'
require 'PipedrivePUT/pipelines'
require 'PipedrivePUT/recents'
require 'PipedrivePUT/organization_field'
require 'PipedrivePUT/activity'
require 'PipedrivePUT/activity-type'
require 'PipedrivePUT/currencies'
require 'PipedrivePUT/deal_fields'
require 'PipedrivePUT/filters'
require 'PipedrivePUT/files'

require 'json'
require 'open-uri'
require 'rest-client'
require 'money'
require 'money/bank/google_currency'


#this is for exchange calculations to make currency format nicely.
I18n.enforce_available_locales = false

module PipedrivePUT

	attr_accessor :key


  	#set the giving API key for pipedrive
	def self.key(key)
	   @@key = key	  
	end
	
	#See which key is givin
	def self.getKey
	  return @@key
	end

end

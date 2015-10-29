require 'httparty'
require 'ostruct'
require 'forwardable'

module PipedrivePUT

  #set html headers -Jsnow 10-29-15
  HEADERS = {
    "User-Agent"    => "Ruby.Pipedrive.Api",
    "Accept"        => "application/json",
    "Content-Type"  => "application/x-www-form-urlencoded"
  }

  #set base class to--> HTTParty globally hopefully that works-Jsnow 10-29-15 
  class MainBAct < OpenStruct

    include HTTParty
    #not sure I like HTTParty but it seems to do the trick -Jsnow 10-29-15    
    base_uri 'api.pipedrive.com/v1'
    headers HEADERS
    format :json

    extend Forwardable
    def_delegators 'self.class', :delete, :get, :post, :put, :resource_path, :bad_response

    attr_reader :data

    #initialize data for ostruct -Jsnow 10-29-15
    def initialize(attrs = {})
      if attrs['data']
        struct_attrs = attrs['data']

        if attrs['additional_data']
          struct_attrs.merge!(attrs['additional_data'])
        end
      else
        struct_attrs = attrs
      end

      super(struct_attrs)
    end

    def update(opts = {})
      res = put "#{resource_path}/#{id}", :body => opts
      if res.success?
        res['data'] = Hash[res['data'].map {|k, v| [k.to_sym, v] }]
        @table.merge!(res['data'])
      else
        false
      end
    end

    class << self
      #Jake sets the api token in another model check again to make sure the token matches.. -Jsnow 10-29-15 
      def authenticate(token)
        default_params :api_token => token
      end
  
        
      #kill if the response is bad... -Jsnow 10-29-15                                 
      def bad_response(response, params={})
        puts params.inspect
        if response.class == HTTParty::Response
          raise HTTParty::ResponseError, response
        end
        raise StandardError, 'Unknown error please try again'
      end

      def new_list( attrs )
        attrs['data'].is_a?(Array) ? attrs['data'].map {|data| self.new( 'data' => data ) } : []
      end
      
      #get all responses -Jsnow 10-29-15 
      def all(response = nil, options={},get_absolutely_all=false)
        res = response || get(resource_path, options)
        if res.ok?
          data = res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
          if get_absolutely_all && res['additional_data']['pagination'] && res['additional_data']['pagination'] && res['additional_data']['pagination']['more_items_in_collection']
            options[:query] = options[:query].merge({:start => res['additional_data']['pagination']['next_start']})
            data += self.all(nil,options,true)
          end
          data
        else
          bad_response(res,attrs)
        end
      end

      def create( opts = {} )
        res = post resource_path, :body => opts
        if res.success?
          res['data'] = opts.merge res['data']
          new(res)
        else
          bad_response(res,opts)
        end
      end
      
      def find(id)
        res = get "#{resource_path}/#{id}"
        res.ok? ? new(res) : bad_response(res,id)
      end

      def find_by_name(name, opts={})
        res = get "#{resource_path}/find", :query => { :term => name }.merge(opts)
        res.ok? ? new_list(res) : bad_response(res,{:name => name}.merge(opts))
      end

      def resource_path
        # Pipedrive seems to be sensitive to capitalisation -Jsnow 10-29-15 
        klass = name.split('::').last
        klass[0] = klass[0].chr.downcase
        klass.end_with?('y') ? "/#{klass.chop}ies" : "/#{klass}s"
      end
    end
  end

end


require "cryptocoincharts_api/version"
require "cryptocoincharts_api/api"

require "faraday"
require "json"

module CryptocoinchartsApi

  class Client
    include CryptocoinchartsApi::API

    def initialize; end

    def self.debug
      @debug ||= false
    end

    def self.debug=(v)
      @debug = !!v
    end

    API_VERSION = 'v2'
    BASE_URL = "http://www.cryptocoincharts.info/#{API_VERSION}/api/"
  
    private
  
    def api_call(method_name, options, verb=:get)
      response = connection(method_name, options, verb)
      puts response.inspect if self.class.debug
      parse_response response
    end
  
    def parse_response(response)
      if response.status.to_i == 200
        JSON.parse response.body, symbolize_names: true
      else
        raise response.status.to_s
      end
    end
  
    def connection(method_name, options, verb)
      conn = Faraday.new(:url => BASE_URL) do |faraday|
        faraday.request  :url_encoded
        faraday.response(:logger) if self.class.debug
        faraday.adapter  Faraday.default_adapter
        faraday.headers['User-Agent'] = "CryptocoinchartsAPI rubygem v#{VERSION}"
      end
  
      case verb
        when :put then conn.put(method_name, options)
        when :post then conn.post(method_name, options)
        when :delete then conn.delete(method_name, options)
        else conn.get(method_name, options)
      end
    end
  
  end
end

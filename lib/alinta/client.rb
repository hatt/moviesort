require 'json'
require 'rest-client'

module Alinta
  class Client

    # Setup the URL instance variable
    def initialize(url)
      @url = url
    end

    # HTTP GET and deserialize the endpoint
    def get(endpoint)
      response = get_raw(endpoint)
      JSON.parse(response, symbolize_names: true)
    end

    # HTTP GET the endpoint
    def get_raw(endpoint)
      RestClient.get(@url + endpoint)
    end

    # Higher level API methods
    def movies
      get('Movies')
    end

  end
end
require 'json'
require 'rest_client'

require 'zinc/order'
require 'zinc/product_details'
require 'zinc/product_prices'
require 'zinc/errors/authentication_error'

module Zinc
  @@url_base = 'https://api.zinc.io/v1/'
  @@api_key = nil

  def self.api_key=(key)
    @@api_key = key
  end

  def self.api_key
    @@api_key
  end

  def self.url_base
    @@url_base
  end

  def self.request(method, url, params)
    raise AuthenticationError unless api_key

    if method == :post and params == {}
      return
    end

    opts = {
        :method => method,
        :user => api_key,
        :url => url,
        :payload => params.to_json,
    }
    response = execute_request(opts)
    return JSON.parse(response)
  end

  def self.execute_request(opts)
    RestClient::Request.execute(opts)
  end
end

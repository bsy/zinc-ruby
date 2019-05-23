require 'zinc/base_order'

module Zinc
  class OrderCase < BaseOrder
    def self.create(order_id, params = {})
      o = OrderCase.new
      response = Zinc.request(:post, url(order_id), params)
      o.set_values(response) if response
      o
    end

    def self.get(order_id)
      o = OrderCase.new
      response = Zinc.request(:get, url(order_id), {})
      o.set_values(response) if response
      o
    end

    def self.url(order_id)
      Zinc.url_base + 'orders' + '/' + order_id + '/case'
    end
  end
end

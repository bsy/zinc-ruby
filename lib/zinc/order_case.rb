require 'zinc/base_order'

module Zinc
  class OrderCase < BaseOrder

    def self.create(case_id, params = {})
      o = OrderCase.new
      response = Zinc.request(:post, url(case_id), params)
      if response
        o.set_values(response)
      end
      o
    end

    def self.get(case_id)
      o = OrderCase.new
      response = Zinc.request(:get, url(case_id), {})
      if response
        o.set_values(response)
      end
      o
    end

    def self.url(case_id)
      Zinc.url_base + 'orders' + '/' + case_id + '/case'
    end

  end
end


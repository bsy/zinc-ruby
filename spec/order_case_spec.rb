require 'spec_helper'

module Zinc
  describe Zinc::OrderCase do
    before { Zinc.api_key = 'foo' }

    describe 'getting the order case url' do
      it 'returns the correct url' do
        Zinc::OrderCase.url('fooid').should ==
          'https://api.zinc.io/v1/orders/fooid/case'
      end
    end
  end
end

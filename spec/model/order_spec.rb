require 'spec_helper'

describe Order do
  let(:amount){ 100 }
  let(:base_price){ 1000 }
  let(:order){ Order.new(amount, base_price) }
  describe 'over_thousand?' do
    subject{ order.over_thousand? }
    context 'base_price > 1000' do
      let(:base_price){ 1001 }
      it{ should be_true }
    end
    context 'base_price <= 1000' do
      let(:base_price){ 1000 }
      it{ should be_false }
    end
  end
end

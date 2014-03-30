require 'spec_helper'

describe Currency do
  let(:currency_1_new) { Currency.new("USD") }
  let(:currency_2_new) { Currency.new("USD") }

  describe "==" do
    it { currency_1_new.should_not == currency_2_new }
  end

  describe "eql?" do
    it { currency_1_new.should_not eql(currency_2_new) }
  end
end

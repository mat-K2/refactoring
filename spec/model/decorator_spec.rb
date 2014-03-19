require 'spec_helper'

describe Decorator do
  let(:post){ Post.new }
  let(:decorator){ Decorator.new(post) }

  describe 'method_missin(sym, *args, &block)' do
    context 'valid method' do
      it{ decorator.success.should be_true }
    end
    context 'invalid method' do
      specify{ expect{ decorator.no_method('arg1', 'arg2') }.to raise_error(NoMethodError) }
    end
  end
end

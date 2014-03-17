require 'spec_helper'

describe Post do
  let(:post){ Post.new }

  describe 'failure' do
    before do
      post.failure
    end
    it{ post.state.should == :failure }
  end

  describe 'error' do
    before do
      post.error
    end
    it{ post.state.should == :error }
  end

  describe 'success' do
    before do
      post.success
    end
    it{ post.state.should == :success }
  end
end

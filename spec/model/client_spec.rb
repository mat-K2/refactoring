require 'spec_helper'

describe Client do
  let(:row) { Performance.new }
  let(:client) { Client.new(row) }

  describe 'name' do
    before do
      row.name = 'test-name'
    end
    subject { client.name }
    it { should == 'test-name' }
  end

  describe 'name=(value)' do
    before do
      client.name = 'test-name'
    end
    it { client.name.should == 'test-name' }
  end

  describe 'wins' do
    before do
      row.name = 'test-name'
      row.wins = '1'
    end
    subject { client.wins }
    it { should == 1 }
  end

  describe 'wins=(value)' do
    before do
      client.wins = '1'
    end
    it { client.wins.should == 1 }
  end
end

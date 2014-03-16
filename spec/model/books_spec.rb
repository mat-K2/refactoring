require 'spec_helper'

describe Books do
  let(:connection){ double(ActiveRecord::ConnectionAdapters) }
  describe 'self.find(selector, conditions="", *joins)' do
    let(:conditions){ "authors.name = 'Jenny James'" }
    let(:joins){ :authors }
    let(:sql_constructed){ "SELECT * FROM books LEFT OUTER JOIN authors ON books.author_id = authors.id WHERE authors.name = 'Jenny James'" }
    let(:find_result){ [{ 'id' => 1 }] }
    before do
      Books.should_receive(:connection).and_return(connection)
      connection.should_receive(:find).with(sql_constructed).and_return(find_result)
    end
    subject{ Books.find(:all, conditions, joins) }
    it{ should == [{ 'id' => 1 }] }
  end
end

require 'spec_helper'

describe Books do
  let(:connection){ double(ActiveRecord::ConnectionAdapters) }
  describe 'self.find(selector, conditions="", *joins)' do
    let(:conditions){ "authors.name = 'Jenny James'" }
    let(:joins){ :authors }
    let(:sql_constructed){ "SELECT * FROM books LEFT OUTER JOIN authors ON books.author_id = authors.id WHERE authors.name = 'Jenny James'" }
    let(:find_result){ [{ 'id' => 1 }] }
    subject{ Books.find(:all, hash) }

    context 'valid_keys' do
      let(:hash){ { :conditions => conditions, :joins => [joins] } }
      before do
        Books.should_receive(:connection).and_return(connection)
        connection.should_receive(:find).with(sql_constructed).and_return(find_result)
      end
      it{ should == [{ 'id' => 1 }] }
    end
    context 'invalid keys' do
      let(:hash){ { :condition => conditions, :join => [joins] } }
      specify{ expect{ subject }.to raise_error(ArgumentError, "Unknown keys(s): condition, join") }
    end
  end
end

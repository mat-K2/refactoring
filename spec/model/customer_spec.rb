# -*- coding: utf-8 -*-
require 'spec_helper'

describe Customer do
  let(:name){ "test-name" }
  let(:customer){ Customer.new(name) }
  describe 'statement' do
    let(:movie_title){ 'movie-title' }
    let(:price_instance){ RegularPrice.new }
    let(:movie){ Movie.new(movie_title, price_instance) }
    let(:days_rented){ 10 }
    let(:rental){ Rental.new(movie, days_rented) }
    before do
      customer.add_rental(rental)
    end
    subject{ customer.statement }
    it{ should == "Rental Record for #{name}\n\t#{movie_title}\t14.0\nAmount owed is 14.0\nYou earned 1 frequent renter points" }
  end
end

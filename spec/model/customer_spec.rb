# -*- coding: utf-8 -*-
require 'spec_helper'

describe Customer do
  let(:name){ "test-name" }
  let(:customer){ Customer.new(name) }
  describe 'statement' do
    let(:movie_title){ 'movie-title' }
    let(:price_code){ 0 }
    let(:movie){ Movie.new(movie_title, price_code) }
    let(:days_rented){ 10 }
    let(:rental){ Rental.new(movie, days_rented) }
    before do
      customer.add_rental(rental)
    end
    subject{ customer.statement }
    it{ should == "Rental Record for #{name}\n\t#{movie_title}\t14.0\nAmount owed is 14.0\nYou earned 1 frequent renter points" }
  end

  describe 'amount_for(rental)' do
    let(:movie){ Movie.new('movie-title', price_code) }
    let(:days_rented){ 10 }
    let(:rental){ Rental.new(movie, days_rented) }
    subject{ customer.amount_for(rental) }
    context '一般の場合' do
      let(:price_code){ 0 }
      it{ should == 14.0 }
    end
    context '新作の場合' do
      let(:price_code){ 1 }
      it{ should == 30.0 }
    end
    context '子供用の場合' do
      let(:price_code){ 2 }
      it{ should == 12.0 }
    end
  end
end

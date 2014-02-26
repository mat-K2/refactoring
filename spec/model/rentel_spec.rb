require 'spec_helper'

describe Rental do
  let(:movie_title){ "test-title" }
  let(:movie_price_code){ 0 }
  let(:movie){ Movie.new(movie_title, movie_price_code) }
  let(:days_rented){ 10 }
  let(:rental){ Rental.new(movie, days_rented) }
  describe 'frequent_renter_points' do
    subject{ rental.frequent_renter_points }
    context 'movie_price_code == 1' do
      let(:movie_price_code){ 1 }
      context 'days_rented > 1' do
        let(:days_rented){ 2 }
        it{ should == 2 }
      end
      context 'days_rented <= 1' do
        let(:days_rented){ 1 }
        it{ should == 1 }
      end
    end
    context 'movie_price_code != 1' do
      let(:movie_price_code){ 0 }
      context 'days_rented > 1' do
        let(:days_rented){ 2 }
        it{ should == 1 }
      end
      context 'days_rented <= 1' do
        let(:days_rented){ 1 }
        it{ should == 1 }
      end
    end
  end
end

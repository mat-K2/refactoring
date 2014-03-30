require 'spec_helper'

describe Rental do
  let(:movie_title){ "test-title" }
  let(:price_instance){ RegularPrice.new }
  let(:movie){ Movie.new(movie_title, price_instance) }
  let(:days_rented){ 10 }
  let(:rental){ Rental.new(movie, days_rented) }

  describe 'charge' do
    subject{ rental.charge }
    it { should == 14 }
  end

  describe 'frequent_renter_points' do
    subject{ rental.frequent_renter_points }
    context 'movie_price_code == 1' do
      let(:price_instance){ NewReleasePrice.new }
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
      let(:price_instance){ RegularPrice.new }
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

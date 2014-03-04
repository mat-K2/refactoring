require 'spec_helper'

describe Movie do
  let(:title){ 'movie-test' }
  let(:price_instance){ double(RegularPrice) }
  let(:number_of_late_deliveries){ nil }
  let(:movie){ Movie.new(title, price_instance, number_of_late_deliveries) }

  describe 'get_rating' do
    subject{ movie.get_rating }
    context 'number of late deliveries > 5' do
      let(:number_of_late_deliveries){ 6 }
      it{ should == 2 }
    end
    context 'number of late deliveries <= 5' do
      let(:number_of_late_deliveries){ 5 }
      it{ should == 1 }
    end
  end
end

require 'garage'
require 'Van'
describe Van do
  let(:bikes) {double(:bikes, Class: Array, size: 5)}
  let(:station) {double(:station, pickup_bikes: bikes)}

  describe "#get_bikes" do
    it { is_expected.to respond_to(:get_bikes).with(1).argument}
    it { expect(subject.get_bikes(station).Class).to eq Array}
  end
  describe "#drop_bikes" do
    it "fills up bikes" do
      subject.get_bikes(station)
      expect(subject.bikes_transit.size).to eq 5
    end
    it "drops off bikes" do
      garage = Garage.new
      subject.get_bikes(station)
      subject.drop_bikes(garage)
      expect(subject.bikes_transit.size).to eq 0
    end
    it "drops off bikes" do
      garage = Garage.new
      subject.get_bikes(station)
      subject.drop_bikes(garage)
      expect(garage.stored_bikes.size).to eq 5
    end
  end
end

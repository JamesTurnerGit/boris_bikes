require 'Van'
describe Van do
  let(:broken_bikes) {double(:broken_bikes, Class: Array, size: 5)}
  let(:station) {double(:station, pickup_bikes: broken_bikes, bike_store:)}
  describe "#get_broken_bikes" do
    it { is_expected.to respond_to(:get_broken_bikes).with(1).argument}
    it { expect(subject.get_broken_bikes(station).Class).to eq Array}
  end
  describe "#drop_bikes" do
    it "fills up bikes" do
    subject.get_broken_bikes(station)
    expect(subject.bikes_transit.size).to eq 5
  end
    it "drops off bikes" do
    subject.get_broken_bikes(station)
    subject.drop_bikes(station)
    expect(subject.bikes_transit.size).to eq 0
    end
  end
end

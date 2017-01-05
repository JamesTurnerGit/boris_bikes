require 'Van'
describe Van do
  let(:broken_bikes) {double(:broken_bikes, Class: Array)}
  let(:station) {double(:DockingStation, pickup_bikes: broken_bikes)}
  describe "#get_broken_bikes" do
    it { is_expected.to respond_to(:get_broken_bikes).with(1).argument}
    it { expect(subject.get_broken_bikes(station).Class).to eq Array}
  end
end

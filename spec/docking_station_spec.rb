require 'DockingStation'

describe  DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :bike}
  it { is_expected.to respond_to(:dock).with(1).argument}


  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#release_bike' do
    it 'raises an error if no bike present' do
      expect{subject.release_bike}.to raise_error("No bikes present")
    end
  end

  describe '#dock' do
    it 'raises an error if there\'s more than twenty bikes present' do
      subject.capacity.times {subject.dock Bike.new}
      expect {subject.dock Bike.new}.to raise_error("Dock full")
    end
  end
end

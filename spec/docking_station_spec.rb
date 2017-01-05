require 'DockingStation'

describe  DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :bikes}
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
    describe 'raises an error if there\'s more than twenty bikes present'do
      it 'raises an error if there is too many bikes'do
        subject.capacity.times{subject.dock Bike.new}
        expect{subject.dock Bike.new}.to raise_error("Dock full")
      end
      it 'and counts broken_bikes in capacity' do
        subject.capacity.times{subject.dock Bike.new}
        subject.report_broken
        expect{subject.dock Bike.new}.to raise_error("Dock full")
      end
    end
  end

  describe '#report_broken' do
    it 'checks size of Broken Bikes' do
      expect(subject.broken_bikes.size).to eq 0
    end
    it 'adds bike to Broken Bikes' do
      subject.dock(Bike.new)
      subject.report_broken
      expect(subject.broken_bikes.size).to eq 1
    end
    it {is_expected.to respond_to :report_broken}
  end
end

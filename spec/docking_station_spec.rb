require 'DockingStation'

describe  DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :bikes}
  it { is_expected.to respond_to(:dock).with(1).argument}
  it { is_expected.to respond_to :report_broken}

  describe '#release_bike' do
    before(:each) do
      subject.dock(double(:bike))
    end
    it 'releases a bike' do
      expect(subject.release_bike.Class).to eq bike
    end
    it 'releases a working bike' do
      expect(subject.release_bike).to be_working
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
        subject.capacity.times{subject.dock double(:bike)}
        expect{subject.dock double(:bike)}.to raise_error("Dock full")
      end
      it 'and counts broken_bikes in capacity' do
        subject.capacity.times{subject.dock double(:bike)}
        subject.report_broken
        expect{subject.dock double(:bike)}.to raise_error("Dock full")
      end
    end
  end

  describe '#report_broken' do
    it 'checks size of Broken Bikes' do
      expect(subject.broken_bikes.size).to eq 0
    end
    it 'adds bike to Broken Bikes' do
      subject.dock(double(:bike))
      subject.report_broken
      expect(subject.broken_bikes.size).to eq 1
    end
  end
end

require 'spec_helper'

RSpec.describe Robot do
  subject { described_class.new }

  describe '#new' do
    specify do
      expect(subject.position).to be_a Position
      expect(subject.position.x).to eq 0
      expect(subject.position.y).to eq 0
      expect(subject.position.direction).to eq 'NORTH'
    end
  end

  describe '#report' do
    before { expect(subject).to receive(:puts).with('0, 0, NORTH').once }

    it "should print the robot's current position" do
      subject.report
    end
  end

  describe '#place' do
    specify 'should update new position' do
      subject.place(3, 3, 'SOUTH')
      
      expect(subject.position).to be_a Position
      expect(subject.position.x).to eq 3
      expect(subject.position.y).to eq 3
      expect(subject.position.direction).to eq 'SOUTH'
    end
  end
end

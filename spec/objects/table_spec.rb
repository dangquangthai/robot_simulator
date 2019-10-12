require 'spec_helper'

RSpec.describe Table do
  let(:robot) { Robot.new }
  subject { described_class.new(length: 5, width: 5) }

  describe '#valid_position?' do
    before { subject.robot = robot }

    context 'all good' do
      it { expect(subject.valid_position?).to be_truthy }
    end

    context 'wrong x' do
      before { robot.place(-1, 3, 'NORTH') }

      it { expect(subject.valid_position?).to be_falsey }
    end

    context 'wrong y' do
      before { robot.place(3, 6, 'WEST') }

      it { expect(subject.valid_position?).to be_falsey }
    end
  end

  describe '#empty?' do
    context 'when robot not present' do
      it { expect(subject.valid_position?).to be_falsey }
    end

    context 'when robot present' do
      before { subject.robot = robot }

      it { expect(subject.valid_position?).to be_truthy }
    end
  end
end

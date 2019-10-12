require 'spec_helper'

RSpec.describe Position do
  let(:direction) { 'WEST' }
  subject { described_class.new(x: '1', y: '2', direction: direction) }

  describe '.attributes' do
    specify do
      expect(subject.x).to eq 1
      expect(subject.y).to eq 2
      expect(subject.direction).to eq 'WEST'
    end
  end

  describe '#turn_left' do
    specify do
      subject.turn_left
      expect(subject.direction).to eq 'SOUTH'

      subject.turn_left
      expect(subject.direction).to eq 'EAST'

      subject.turn_left
      expect(subject.direction).to eq 'NORTH'

      subject.turn_left
      expect(subject.direction).to eq 'WEST'
    end
  end

  describe '#turn_right' do
    specify do
      subject.turn_right
      expect(subject.direction).to eq 'NORTH'

      subject.turn_right
      expect(subject.direction).to eq 'EAST'

      subject.turn_right
      expect(subject.direction).to eq 'SOUTH'

      subject.turn_right
      expect(subject.direction).to eq 'WEST'
    end
  end

  describe '#move' do
    before { subject.move }
    
    context 'when facing to the WEST' do
      let(:direction) { 'WEST' }

      specify do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 2
      end
    end

    context 'when facing to the SOUTH' do
      let(:direction) { 'SOUTH' }

      specify do
        expect(subject.x).to eq 1
        expect(subject.y).to eq 1
      end
    end

    context 'when facing to the EAST' do
      let(:direction) { 'EAST' }
      
      specify do
        expect(subject.x).to eq 2
        expect(subject.y).to eq 2
      end
    end

    context 'when facing to the NORTH' do
      let(:direction) { 'NORTH' }
      
      specify do
        expect(subject.x).to eq 1
        expect(subject.y).to eq 3
      end
    end
  end
end

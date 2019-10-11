require 'spec_helper'

RSpec.describe Direction do
  describe '#north' do
    it { expect(described_class.north).to eq 'NORTH' }
  end

  describe '#east' do
    it { expect(described_class.east).to eq 'EAST' }
  end

  describe '#south' do
    it { expect(described_class.south).to eq 'SOUTH' }
  end

  describe '#west' do
    it { expect(described_class.west).to eq 'WEST' }
  end
end

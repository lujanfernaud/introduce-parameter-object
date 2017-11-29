require 'spec_helper'

describe NormalShipping do
  describe '.conversion_factor' do
    it 'returns conversion factor' do
      expect(described_class.conversion_factor).to eq(6.67)
    end
  end

  describe '.rate' do
    it 'returns rate' do
      expect(described_class.rate).to eq(2.75)
    end
  end
end

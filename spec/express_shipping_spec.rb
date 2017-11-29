require 'spec_helper'

describe ExpressShipping do
  describe '.conversion_factor' do
    it 'returns conversion factor' do
      expect(described_class.conversion_factor).to eq(3.33)
    end
  end

  describe '.rate' do
    it 'returns rate' do
      expect(described_class.rate).to eq(4.25)
    end
  end
end

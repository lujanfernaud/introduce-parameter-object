require 'spec_helper'

describe Package do
  describe '#height' do
    it 'returns package height' do
      expect(package.height).to eq(4.0)
    end
  end

  describe '#length' do
    it 'returns package length' do
      expect(package.length).to eq(3)
    end
  end

  describe '#weight' do
    it 'returns package weight' do
      expect(package.weight).to eq(50)
    end
  end

  describe '#width' do
    it 'returns package width' do
      expect(package.width).to eq(2.5)
    end
  end

  describe '#volume' do
    it 'returns package volume' do
      volume = package.height * package.length * package.width
      expect(package.volume).to eq(volume)
    end
  end

  def package
    @package ||= Package.new(height: 4.0, length: 3, weight: 50, width: 2.5)
  end
end

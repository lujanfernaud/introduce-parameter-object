require 'spec_helper'

describe Package do
  describe '#height' do
    it 'returns package height' do
      package.height = 5.0
      expect(package.height).to eq(5.0)
    end
  end

  describe '#length' do
    it 'returns package length' do
      package.length = 4
      expect(package.length).to eq(4)
    end
  end

  describe '#weight' do
    it 'returns package weight' do
      package.weight = 60
      expect(package.weight).to eq(60)
    end
  end

  describe '#width' do
    it 'returns package width' do
      package.width = 3.1
      expect(package.width).to eq(3.1)
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

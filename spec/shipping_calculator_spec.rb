require 'spec_helper'

describe ShippingCalculator do
  describe '.calculate_normal_shipping' do
    it 'determines the cost of normal shipping' do
      expected_cost = 618.44
      cost = described_class.calculate_normal_shipping_for package

      expect(cost).to eq expected_cost
    end
  end

  describe '.calculate_express_shipping' do
    it 'determines the cost of express shipping' do
      expected_cost = 1914.41
      cost = described_class.calculate_express_shipping_for package

      expect(cost).to eq expected_cost
    end
  end

  def package
    @package ||= Package.new(height: 4.0, length: 3, weight: 50, width: 2.5)
  end
end

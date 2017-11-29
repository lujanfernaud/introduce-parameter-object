class ShippingCalculator
  def self.calculate_normal_shipping_for(package)
    new(package, NormalShipping).total_cost
  end

  def self.calculate_express_shipping_for(package)
    new(package, ExpressShipping).total_cost
  end

  def total_cost
    package_cost.round(2)
  end

  private

  attr_reader :package, :shipping

  def initialize(package, shipping)
    @package  = package
    @shipping = shipping
  end

  def package_cost
    package.volume * conversion * shipping.rate
  end

  def conversion
    package.weight / shipping.conversion_factor
  end
end

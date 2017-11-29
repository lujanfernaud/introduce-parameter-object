# Upcase Refactoring Trail

## Introduce Parameter Object

Refactoring exercise using the [Introduce Parameter Object](https://refactoring.com/catalog/introduceParameterObject.html) refactoring for the [Upcase Refactoring Trail](https://thoughtbot.com/upcase/refactoring).

### Introduce Parameter Object

> You have a group of parameters that naturally go together. Replace them with an object. -- Martin Fowler

#### Before

```ruby
# shipping_calculator.rb

class ShippingCalculator
  EXPRESS_CONVERSION_FACTOR = 3.33
  EXPRESS_RATE = 4.25
  NORMAL_CONVERSION_FACTOR = 6.67
  NORMAL_RATE = 2.75

  def calculate_cost(height, length, weight, width, express=nil)
    volume = find_volume(height, length, width)

    if express
      express_shipping(volume, weight)
    else
      normal_shipping(volume, weight)
    end
  end

  private

  def find_volume(height, length, width)
    height * length * width
  end

  def express_shipping(volume, weight)
    cost = volume * (weight / EXPRESS_CONVERSION_FACTOR) * EXPRESS_RATE
    cost.round(2)
  end

  def normal_shipping(volume, weight)
    cost = volume * (weight / NORMAL_CONVERSION_FACTOR) * NORMAL_RATE
    cost.round(2)
  end
end
```

#### After

```ruby
# shipping_calculator.rb

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
```

```ruby
# package.rb

class Package
  attr_accessor :height, :length, :weight, :width

  def initialize(arguments = {})
    @height = arguments[:height]
    @length = arguments[:length]
    @weight = arguments[:weight]
    @width  = arguments[:width]
  end

  def volume
    height * length * width
  end
end
```

```ruby
# normal_shipping.rb

class NormalShipping
  CONVERSION_FACTOR = 6.67
  RATE = 2.75

  def self.conversion_factor
    CONVERSION_FACTOR
  end

  def self.rate
    RATE
  end
end
```

```ruby
# express_shipping.rb

class ExpressShipping
  CONVERSION_FACTOR = 3.33
  RATE = 4.25

  def self.conversion_factor
    CONVERSION_FACTOR
  end

  def self.rate
    RATE
  end
end
```

### Additional Resources

- [Refactoring Guru: Introduce Parameter Object](https://refactoring.guru/introduce-parameter-object)

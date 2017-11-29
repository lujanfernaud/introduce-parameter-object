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

require 'pry'
class Triangle
  attr_accessor :a, :b, :c
  @@all = []

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    valid_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def valid_triangle
    triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each do |sides|
      triangle << false if sides <= 0
      raise TriangleError if triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end
end

#t = Triangle.new(4, 4, 4)
#t1 = Triangle.new(2, 3, 4)
#t2 = Triangle.new(0,1,2)
#t3 = Triangle.new(3, 3, 6)
#binding.pry



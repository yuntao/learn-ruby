# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # Check for error conditions
  sum_ab = a + b
  sum_bc = b + c
  sum_ac = a + c
  raise TriangleError, "Invalid side length" if sum_ab <= c || sum_bc <= a || sum_ac <= b

  # Normal logic
  ab = a == b
  bc = b == c
  ac = a == c

  if ab && bc && ac
    :equilateral
  elsif ab || bc || ac
    :isosceles
  else
    :scalene
  end

  # A more concise version from Stackoverflow
  # a, b, c = [a, b, c].sort
  # raise TriangleError if a <= 0 || a + b <= c
  # [nil, :equilateral, :isosceles, :scalene][[a, b, c].uniq.size]
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

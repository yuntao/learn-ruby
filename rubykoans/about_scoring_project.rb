require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
# (1=100  1,1=200  1,1,1=1000)
# (5=50   5,5=100  5,5,5=500 )
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points   1,1,1,1,5
# score([2,3,4,6,2]) => 0 points      2,2,3,4,6
# score([3,4,5,3,3]) => 350 points    3,3,3,4,5
# score([1,5,1,2,4]) => 250 points    1,1,2,4,5
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  one_score = [100, 100, 800]
  five_score = [50, 50, 400]

  itemCount = 0
  lastItem = 0

  dice.sort.inject(0) {
    |points, item|

    # Update count and track last item
    itemCount = item == lastItem ? itemCount + 1 : 1
    itemCount = itemCount == 4 ? 1 : itemCount
    lastItem = item

    # Calculate points
    if item == 1
      points += one_score[itemCount - 1]
    elsif item == 5
      points += five_score[itemCount - 1]
    elsif itemCount == 3
      points += 100 * item
    else
      points
    end
  }
end

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
    assert_equal 1100, score([1,1,1,1])
    assert_equal 1200, score([1,1,1,1,1])
    assert_equal 1150, score([1,1,1,5,1])
  end

end

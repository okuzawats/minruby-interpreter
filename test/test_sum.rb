require 'minruby'
require_relative '../test_helper'
require_relative '../lib/sum'

class TestSum < Minitest::Test
  def test_sum
    assert_equal 10, sum(minruby_parse('(1 + 2) + (3 + 4)'))
  end
end

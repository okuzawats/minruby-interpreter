require 'minruby'
require_relative '../test_helper'
require_relative '../lib/interpreter'

class TestSum < Minitest::Test
  def test_arithetic_operation
    assert_equal 100, evaluate(minruby_parse('(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)'))
  end
end

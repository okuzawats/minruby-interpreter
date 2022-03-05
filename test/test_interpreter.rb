require 'minruby'
require_relative '../test_helper'
require_relative '../lib/interpreter'

class TestSum < Minitest::Test
  def test_arithetic_operation
    assert_equal 100, evaluate(minruby_parse('(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)'))
  end

  def test_only_literal
    assert_equal 42, evaluate(minruby_parse('42'))
  end

  def test_addition
    assert_equal 42, evaluate(minruby_parse('2 + 40'))
  end

  def test_minus
    assert_equal 42, evaluate(minruby_parse('50 - 8'))
  end

  def test_multiplication
    assert_equal 42, evaluate(minruby_parse('7 * 6'))
  end

  def test_division
    assert_equal 42, evaluate(minruby_parse('84 / 2'))
  end
end


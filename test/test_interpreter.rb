require 'minruby'
require_relative '../test_helper'
require_relative '../lib/interpreter'

class TestSum < Minitest::Test
  def test_arithetic_operation
    assert_equal 100, evaluate(minruby_parse('(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)'))
  end

  def test_arithetic_operation2
    assert_equal 81, evaluate(minruby_parse('((3 + 4) % 4) ** 4'))
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

  def test_remainder
    assert_equal 1, evaluate(minruby_parse('9 % 4'))
  end

  def test_exponentiation
    assert_equal 81, evaluate(minruby_parse('3 ** 4'))
  end

  def test_equals_true
    assert_equal true, evaluate(minruby_parse('1 == 1'))
  end

  def test_equals_false
    assert_equal false, evaluate(minruby_parse('1 == 2'))
  end

  def test_not_equals_true
    assert_equal true, evaluate(minruby_parse('1 != 2'))
  end

  def test_not_equals_false
    assert_equal false, evaluate(minruby_parse('1 != 1'))
  end
end


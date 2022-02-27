require 'minitest/autorun'
require_relative '../lib/sample'

class TestSample < Minitest::Test
  def test_answer_return_true_if_42
    assert_equal true, answer(42)
  end

  def test_answer_return_false_if_not_42
    assert_equal false, answer(0)
  end
end

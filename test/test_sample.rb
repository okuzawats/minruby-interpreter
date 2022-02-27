require 'minitest/autorun'
require_relative '../lib/sample'

class TestSample < Minitest::Test
  def test_answer_returns_true
    assert_equal true, answer(42)
  end

  def test_answer_returns_false
    assert_equal false, answer(0)
  end
end

require 'minitest/autorun'
require_relative '../lib/sample'

class TestSample < Minitest::Test
  def testAnswerReturnTrueIf42
    assert_equal true, answer(42)
  end

  def testAnswerReturnFalseIfNot42
    assert_equal false, answer(0)
  end
end

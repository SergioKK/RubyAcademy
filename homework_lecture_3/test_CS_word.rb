require 'test/unit'
require_relative 'CS_word'
class StringExtensionTest < Test::Unit::TestCase
  def test_cs_word
    assert_not_equal(cs_word("word"), nil)
    assert_equal(cs_word("word"), "drow")
    assert_equal(cs_word("wordcs"), 64)
    assert_equal(cs_word("wordCs"), 64)
  end
end

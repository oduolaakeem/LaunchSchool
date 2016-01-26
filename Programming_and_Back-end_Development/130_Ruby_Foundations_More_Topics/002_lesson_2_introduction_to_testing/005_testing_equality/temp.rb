require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_euqlity
    str1 = "hi there"
    str2 = "hi there"
    
    assert_equal(str1, str2)
    assert_same(str1, str2)
  end
end
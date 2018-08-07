require "minitest/autorun"
require_relative "isbn.rb"

class ISBN < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end
    
    def test_if_isbn_bad
        assert_equal(false, isbn_10("yxz"))
    end

    def test_if_isbn_good
        assert_equal(true, isbn_10("7421394761"))
    end
    
end
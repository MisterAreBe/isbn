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

    def test_ignore_dash_and_space
        assert_equal(true, isbn_10("74-2-1 3-9 4-7 61"))
    end

    def test_only_numbers
        assert_equal(false, isbn_10("abcdefghij"))
    end

    def test_wrong_isbn
        assert_equal(false, isbn_10("7421394769"))
    end

    def test_isbn13_bad
        assert_equal(false, isbn_13("xyz"))
    end

end
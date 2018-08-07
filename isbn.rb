def isbn_10(num)
    num.gsub!(/[- ]/, '')
    if num.length != 10
        return false
    elsif num.to_i.to_s != num
        return false
    end

    true
end





# Example of how the ISBN-10 sumcheck is calculated:
# first 9 digits of an isbn10: 742139476
# create checksum:
# sum = 17 + 24 + 32 + 41 + 53 + 69 74 + 87 + 9*6
# sum = 7 + 8 + 6 + 4 + 15 + 54 + 28 + 56 + 54
# sum = 232
# checksum = 232%11
# checksum = 1
# isbn = 7421394761
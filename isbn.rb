def isbn_10(num)
    num.gsub!(/[- ]/, '')
    bad = 0
    if num.gsub(/[\D]/, '') != num
        bad += 1
    end
    if num.end_with?('x') || num.end_with?('X')
        bad -= 1
        check = num.gsub(/[\D]/, '')
        x = num[-1]
        if "#{check}#{x}" != num
            bad += 1
        end
    end
     
    unless bad <= 0
        return false
    end

    temp = num.split('')
    check_digit = temp.pop

    if check_digit == 'x' || check_digit == 'X'
        check_digit = 10
    end

    sum = 0

    temp.each_with_index do |v,i|
        holder = v.to_i * (i + 1)
        sum += holder
    end

    checksum = sum % 11

    if checksum == check_digit.to_i
        return true
    else
        return false
    end
end

def isbn_13(num)
    num.gsub!(/[- ]/, '')
    if num.gsub(/[\D]/, '') != num
        return false
    end

    temp = num.split('')
    check_digit = temp.pop

    sum = 0
    count = 0

    temp.each do |v|
        if count % 2 == 0
            alt = 1
        else
            alt = 3
        end
        holder = v.to_i * alt
        sum += holder
        count += 1
    end
    
    checksum = 10 - (sum % 10)
    if checksum.to_s.length > 1
        checksum %= 10
    end

    if checksum == check_digit.to_i
        return true
    else
        return false
    end
end

def isbn(num)
    num.gsub!(/[- ]/, '')
    if num.length == 10
        return isbn_10(num)
    elsif num.length == 13
        return isbn_13(num)
    else
        return false
    end
end
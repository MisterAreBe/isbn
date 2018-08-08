require 'CSV'
require_relative 'isbn.rb'

CSV.foreach("input_isbn_file.csv") do |v|

end

x = CSV.read("input_isbn_file.csv")

temp = []

x.each do |z|
    z.each_with_index do |v,i|
        if i == 1
            temp << v
        end
    end
end

puts "#{temp}"



CSV.open("output_isbn_file.csv", "wb") do |csv|
    
end
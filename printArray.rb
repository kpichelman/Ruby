puts "Creating array of 16 numbers'
ary = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]


puts "Day 2, Exricise 1"

# Ugly but works.  It should really count on its own from x-4 to x, not just hardcode.
ary.each { |idx| if (idx %4 == 0) : puts ""  + (idx-3).to_s + "," + (idx-2).to_s+ ","  + (idx-1).to_s+ ","  + idx.to_s end}

# Very easy with the Enumerable class
(1..16).each_slice(4) {|a| p a}


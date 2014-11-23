n = ARGV.shift.to_i
sum,square = 0,0
1.upto(n).each do |x|
	sum += x*x
	square += x
end
square = square*square
puts "#{sum} #{square} => #{square - sum}"

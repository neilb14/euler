sum,n = 0,ARGV.shift.to_i
1.upto(n-1).each do |i|
	next unless i%3 == 0 or i%5 == 0
	sum += i
end
puts sum
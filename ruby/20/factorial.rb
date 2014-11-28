n = ARGV.shift.to_i
factorial = 1
n.downto(2).each do |i|
	factorial *= i
end
sum = 0
factorial.to_s.each_char do |c|
	sum += c.to_i
end
puts sum

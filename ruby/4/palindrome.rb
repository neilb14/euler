def is_palindrome?(number)
	0.upto(number.length/2) do |x|
		return false if number[x] != number[number.length - (x+1)]
	end
	return true
end

n,champion = "", 0
ARGV.shift.to_i.downto(1).each { |x| n << "9" }
start_i = n.to_i
start_i.downto(0).each do |i|
	start_i.downto(0).each do |j|
		result = i*j
		if is_palindrome?(result.to_s)
			champion = result if result > champion
			puts "#{i} x #{j} = #{result}"
		end
	end
end

puts champion
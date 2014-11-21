def is_divisible?(number,n)
	n.downto(1).each do |x|
		return false if number%x != 0
	end
	return true
end

n = ARGV.shift.to_i
current = n
while(!is_divisible?(current,n)) do
	current += n
end
puts current
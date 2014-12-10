result = 0
for i in 2..999999
	sum = 0
	i.to_s.each_char do |c|
		sum += c.to_i**5
	end
	result += sum if sum == i
end
puts result

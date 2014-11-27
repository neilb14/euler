numbers = []
File.open('data.txt','r').each_line do |line|
	numbers << line.chomp.split('')
end
sums = Array.new(50)
49.downto(0).each do |i|
	sum = 0
	numbers.each do |num|
		sum += num[i].to_i
	end
	sums[i] = sum
end
results,carry = Array.new(50), 0
49.downto(0).each do |i|
	current = sums[i] + carry
	carry = current/10
	results[i] = current - carry*10
end
result = carry.to_s
for i in 0..49
	result += results[i].to_s
end
puts result[0..9]
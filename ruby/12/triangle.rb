n,i,factors,last_num = ARGV.shift.to_i,1,0,0
while(factors < n) 
	last_num += i
	left,right,factors = 2,i,2
	while left < right
		right = last_num/left
		if right.to_i * left == last_num
			factors +=2
		end
		left += 1
	end
	i+=1
end
puts "#{last_num} (#{factors})" 
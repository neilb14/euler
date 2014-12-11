def is_pandigital(nums)
	count,check = 0,{}
	nums.each do |n|
		n.to_s.each_char do |c|
			return false if c == '0'
			return false if check[c]
			check[c] = true
			count += 1
		end
	end
	return count == 9
end

map,sum = {},0
for i in 1..99
	for j in 1..9999
		k = i*j
		next if map[k]
		if is_pandigital([i,j,k])
			map[k] = true
			sum+=k
			puts "#{i} x #{j} = #{k} (#{sum})"
		end
	end
end

puts sum
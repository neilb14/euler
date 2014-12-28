def check(num_as_string)
	i=1
	[2,3,5,7,11,13,17].each do |div|
		return false unless num_as_string.chars[i,3].join('').to_i % div == 0
		i+=1
	end
	true
end

puts [0,1,2,3,4,5,6,7,8,9].permutation
		.map{|p| p.join('') }
		.select{|p| check(p) }
		.map{|p| p.to_i }
		.reduce(:+)
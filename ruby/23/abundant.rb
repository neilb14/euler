def divisors_of(n)
	results = [1]
	for i in 2..(n-1)
		factor = n/i
		next unless factor*i == n
		results << i
	end
	results
end

def is_sum_of(num,list, lookup)
	list.each do |a|
		other = num-a
		if lookup[other]
			return true
		end
	end
	false
end

abundant_lookup = {}
abundants = []
for n in 12..28123
	sum = 0
	divisors_of(n).each {|x| sum+=x}
	next if sum <= n
	abundant_lookup[n] = true
	abundants << n
end
puts "There are #{abundant_lookup.length} (#{abundants.length}) abundant numbers below 28,123"

result = 0
for n in 1..28123
	result+=n unless is_sum_of(n, abundants, abundant_lookup)
end

puts "The sum of numbers that cannot be expressed as a sum of two abundants is [#{result}]"

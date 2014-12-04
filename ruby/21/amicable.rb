def divisors_of(n)
	results = [1]
	for i in 2..(n-1)
		factor = n/i
		next unless factor*i == n
		results << i
	end
	results
end

def sum(list)
	sum=0
	list.each do |n|
		sum+=n
	end
	sum
end

start = ARGV.shift.to_i
results = []
start.downto(1).each do |n|
	result = sum(divisors_of(n))
	next if result == n
	next unless sum(divisors_of(result)) == n
	results << result
end
puts results.inspect
puts sum(results)
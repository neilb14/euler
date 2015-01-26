require 'prime'
target = ARGV.shift.to_i

def is_prime_pair(r, prime)
	a,b = (r.to_s + prime.to_s).to_i, (prime.to_s + r.to_s).to_i
	Prime.prime?(a) and Prime.prime?(b)
end

def compatible(pairs)
	return [] unless pairs.length > 0
	me,set = pairs.pop, []
	pairs.each do |p|
		if is_prime_pair(me,p)
			set << p
		end
	end
	[me] + compatible(set)
end

primes, champion, all_primes = Prime.each, nil, []
p = primes.first
while(champion.nil? or champion[:sum] > p)
	pairs = []
	all_primes.each do |n|
		if is_prime_pair(n,p)
			pairs << n
		end
	end
	pairs.each do |n|
		set = [p] + compatible(pairs)
		next unless set.length >= target
		sum = set.reduce(:+)
		champion = {sum:sum, count:set.length, primes:set} if champion.nil? or sum < champion[:sum]
	end
	all_primes << p
	p = primes.first
end
puts "Sum #{champion.inspect}"
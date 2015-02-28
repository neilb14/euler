require 'prime'
@memoize = {}

def is_concat_prime?(a,b)
	return false unless Prime.prime?((a.to_s + b.to_s).to_i)
	return false unless Prime.prime?((b.to_s + a.to_s).to_i)
	return true
end

def build_sets(list)
	return [list] unless list.length > 1
	return @memoize[list.to_s] if @memoize[list.to_s]	
	results= []
	for a in list
		set = []
		for b in list
			next if a == b
			next unless is_concat_prime?(a,b)
			set << b
		end
		for sub_set in build_sets(set)
			results << [a] + sub_set
		end
	end
	@memoize[list.to_s] = results
	results
end

all_primes = []
Prime.each do |p|
	compatibles = []
	for prime in all_primes
		next unless is_concat_prime?(p, prime)
		compatibles << prime
	end
	sets = build_sets(compatibles)
	champion = nil
	for set in sets
		set += [p]
		next if set.length < 5 	
		sum = set.reduce(:+)
		champion = {sum:sum, set:set} if champion.nil? or sum < champion[:sum]
	end
	if champion.nil?
		all_primes << p
	else
		puts champion.inspect
		exit
	end
end
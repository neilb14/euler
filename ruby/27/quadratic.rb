require 'prime'

def sequential_primes(a,b)
	return false if a == 0
	for n in 0..a.abs
		return false unless Prime.prime? n**2+a*n+b
	end
	true
end

champion = {count:0}
for a in -999..999
	for b in -999..999
		if sequential_primes(a,b)
			champion = {count:a.abs,a:a,b:b} if a.abs > champion[:count]
		end
	end
end

puts champion[:a]*champion[:b]


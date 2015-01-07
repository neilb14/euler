require 'prime'
n = 4

def prime_factors(n)
	return [[n]] if Prime.prime?(n)
	current,last,results = 2,1,[]
	while(current < n/last)
		if n.to_f/current % 1 == 0
			factors = prime_factors(current).concat(prime_factors(n/current))
			results << factors.flatten.uniq.sort
		end
		last = current
		current+=1
	end
	results.uniq
end

i,results=104812,[]
while(results.length < n)
		puts "#{i} (#{results.length})" if results.length > 1
		if prime_factors(i).any?{|f| f.length == n}
			results << i
		else
			results=[]
		end
		i+=1
end
puts results.inspect
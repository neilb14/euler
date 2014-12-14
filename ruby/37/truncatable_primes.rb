require 'prime'
def truncated_prime?(num)
	digits = num.to_s.chars
	while(digits.length > 0)
		return false unless Prime.prime? digits.join('').to_i
		digits.shift
	end
	digits = num.to_s.chars
	while(digits.length > 0)
		return false unless Prime.prime? digits.join('').to_i
		digits = digits[0,digits.length-1]
	end
	true
end

primes,count,sum=Prime.each,0,0
while(count < 11)
	p = primes.next
	next if p <= 10
	if truncated_prime? p
		count+=1
		sum+=p
		puts "#{p} (#{count})"
	end
end
puts "Sum #{sum}"
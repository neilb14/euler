require 'prime'
max = ARGV.shift.to_i

l,n,corners,prime_corners = 1,1,1,0
while(prime_corners == 0 or prime_corners.to_f/corners.to_f*100 >= max)
	l+=2
	position = 0
	while(position < (l*2+(l-2)*2))
		position+=1
		n+=1
		if position % (l-1) == 0
			corners+=1
			prime_corners +=1 if Prime.prime?(n)
		end
	end
end

puts l
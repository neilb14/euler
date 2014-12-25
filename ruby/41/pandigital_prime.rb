# generate pandigital numbers and then test for prime
require 'prime' 
digits = [9,8,7,6,5,4,3,2,1]
while(true)
	digits.permutation(digits.length).each do |d|
		if Prime.prime?(d.join('').to_i)
			puts d.join('')
			exit
		end
	end
	digits.shift
end
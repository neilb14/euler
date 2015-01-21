count = 0
for i in 0..999
	part = 2*i+Rational(1,2)
	i.times do
		part = 2+1/part
	end
	result = 1 + part
	puts result.to_r
	count+=1 if result.numerator.to_s.chars.length > result.denominator.to_s.chars.length	
end
puts count
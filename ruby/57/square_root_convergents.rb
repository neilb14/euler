count = 0
for i in 0..999
	denominator = 2
	i.times do
		denominator = 2+Rational(1,denominator)
	end
	result = 1+Rational(1,denominator)
	count+=1 if result.numerator.to_s.chars.length > result.denominator.to_s.chars.length	
end
puts count


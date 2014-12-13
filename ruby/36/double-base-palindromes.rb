def is_palindrome(num)
	digits,length = num.to_s.chars, num.to_s.length
	for i in 0..(length/2)
		return false unless digits[i] == digits[length-1-i]
	end
	true
end

sum =0
for n in 0..999_999
	next unless is_palindrome(n)
	next unless is_palindrome(n.to_s(2))
	sum +=  n
end
puts sum
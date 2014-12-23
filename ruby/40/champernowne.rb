result,digit,lookup = 1,0,{}
(0..7).each {|i| lookup[10**i] = true}
for i in 1..1_000_000
	i.to_s.each_char do |c|
		digit += 1
		if lookup[digit]
			result *= c.to_i
		end
	end
end
puts result
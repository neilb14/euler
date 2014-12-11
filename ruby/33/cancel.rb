require 'bigdecimal'
result = [1,1]
for n in 10..99
	for d in 10..99
		next if n >= d
		same = d.to_s.chars.detect {|x| n.to_s.chars.include? x }
		next if same.nil? or same == '0'
		n2 = n.to_s.chars.reject {|x| x == same}[0].to_i
		d2 = d.to_s.chars.reject {|x| x == same}[0].to_i
		next if n2 >= d2
		if BigDecimal.new(n,3).div(d,3) == BigDecimal.new(n2,3).div(d2,3)
			puts "#{n}/#{d} ==> #{n2}/#{d2} (#{BigDecimal.new(n,3).div(d,3)})"
			result[0]*=n2
			result[1]*=d2
		end
	end
end

puts "#{result[0]}/#{result[1]}"
def is_pandigital?(num)
	return false unless num.to_s.length == 9
	results = {'0' => true}
	num.to_s.each_char do |c|
		return false if results[c]
		results[c] = true
	end
	true
end

champion,champ_notes = 0, ""
for n in 0..99999
	result,i = "",1
	while(result.length < 9)
		result += (n*i).to_s
		i+=1
	end
	if is_pandigital?(result)
		if result.to_i > champion
			champion= result.to_i 
			champ_notes = "#{result} (#{n} x 1..#{i})"
		end
	end
end

puts "Largest Pandigital Multiple is: #{champ_notes}"
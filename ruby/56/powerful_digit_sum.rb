champ = 0
for a in 1..99
	for b in 1..99
		sum = (a**b).to_s.chars.map{|c| c.to_i }.reduce(:+)
		champ = sum if sum > champ
	end
end
puts champ
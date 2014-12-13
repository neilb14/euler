require 'prime'
count = 0
Prime.each(1_000_000) do |n|
	digits = n.to_s.chars.map {|c| c.to_i }
	combos = []
	digits.length.downto(1) do |i|
		combos << digits.rotate(i).join('').to_i
	end
	count+=1 if combos.all? {|n| Prime.prime? n }
end 
puts count
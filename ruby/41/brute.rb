require 'prime' 

def is_pandigital(num_as_string)
	return false if num_as_string =~ /0/
	map,length = {},num_as_string.length
	num_as_string.each_char do |c|
		return false if map[c]
		return false if c.to_i > length
		map[c] = true
	end
	true
end

Prime.each do |p| 
	break unless p <= 987_654_321
	next unless is_pandigital(p.to_s)
	puts p
end
	
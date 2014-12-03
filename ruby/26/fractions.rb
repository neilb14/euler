require 'bigdecimal'
def has_harmonics?(window)
	size = 1
	while(size < window.length/2)
		parts,current = [],Array.new(window)
		puts "Harmonics: #{size} | #{window.join('')} [#{window.length}]"
		while(current.length >= size)
			parts << current.shift(size).join('')
		end
		if parts.all?{|x| x == parts[0]}
			puts "Harmonics: #{size} | #{parts.inspect} has harmonics"
			return true
		end
		size+=1
	end
	false
end

def is_repeating?(window, remaining)
	return false if remaining.nil? or remaining.length < window.length
	if has_harmonics?(window)
		puts "#{window} has harmonics"
		return false
	end
	for i in 0..(remaining.length-1)
		return false unless window[i%window.length] == remaining[i]
	end
	puts ""
	true
end

def has_a_repeating_sequence_of_size?(size, num)
	for i in 0..(num.length-size)
		return true if is_repeating?(num.slice(i,size),num[(i+size)..(num.length-1)])
	end
	false
end

window_size,champion = 6, 7
1000.downto(champion).each do |d|
	x = BigDecimal.new("1.0").div(d,100)
	num = x.to_s.split('')
	num.shift(2)
	e_index = num.index('E')
	num = num[0..(e_index-2)]
	s,max_size,found = window_size+1,num.length-window_size,false
	while(s < max_size and not found)
		if has_a_repeating_sequence_of_size?(s,num)
			window_size=s
			champion=d
			found=true
			puts "[#{d}] #{num.join('')} => (#{s})"
		else
			s+=1
		end
	end
end
puts "#{champion} is #{window_size} (#{BigDecimal.new("1.0").div(champion,100)})"
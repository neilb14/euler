require 'bigdecimal'
@log_prefix = ""

def log(message)
	puts "#{@log_prefix} #{message}"
end

def has_harmonics?(window)
	size = 1
	while(size < (window.length-1))
		parts,current = [],Array.new(window)
		while(current.length >= size)
			parts << current.shift(size).join('')
		end
		if parts.length == window.length.to_f/size.to_f and parts.all?{|x| x == parts[0]}
			#log "#{window.join('')} HAS HARMONICS (#{parts.inspect})"
			return true
		end
		size+=1
	end
	#log "#{window.join('')} HAS NO HARMONICS"
	false
end

def is_repeating?(window, remaining)
	return false if remaining.nil? or remaining.length < window.length
	return false if has_harmonics?(window)
	for i in 0..(remaining.length-1)
		return false unless window[i%window.length] == remaining[i]
	end
	true
end

def has_a_repeating_sequence_of_size?(size, num)
	for i in 0..(num.length-size)
		window = num.slice(i,size)
		remaining = num[(i+size)..(num.length-1)]
		next if window.length > remaining.length
		#log "Checking #{window.join('')} in #{remaining.join('')}"
		if is_repeating?(window,remaining)
		#	log "FOUND REPEATING: #{window.join('')} in #{remaining.join('')}"
			return true
		end
	end
	false
end

window_size,champion = 6, 7
1000.downto(champion).each do |d|
	@log_prefix = "[#{d}]"
	x = BigDecimal.new("1.0").div(d,801)
	num = x.to_s.split('')
	num.shift(2)
	e_index = num.index('E')
	num = num[0..(e_index-2)]
	s,max_size,found = window_size+1,num.length-window_size,false
	while(s < max_size and not found)
		@log_prefix = "[#{d}] [#{s}]"
		if has_a_repeating_sequence_of_size?(s,num)
			window_size=s
			champion=d
			found=true
			log "Found repeating sequence #{num.join('')} => (#{s})"
		else
			s+=1
		end
	end
end
puts "#{champion} is #{window_size} (#{BigDecimal.new("1.0").div(champion,100)})"
require 'prime'

map = {}
Prime.each.take_while{|i| i < 1_000_000}.reverse.each do |p|
	results,found,last_try = [],false,p
	while(not found and last_try > 2)
		
		remainder, results, sequence = p, [], Prime.each.take_while{|i| i < last_try}.reverse	
		puts "#{p} => #{sequence.length} (#{last_try})"
		while(remainder > 0 and sequence.length > 0)
			last_try = sequence[0] if remainder == p
			remainder -= sequence[0]
			results << sequence.shift
		end
		if remainder == 0
			
			map[results.length] = [] unless map[results.length]
			map[results.length] << {prime:p, results:results}
			found = true
		end
	end
end
map.keys.sort.each do |k|
	map[k].each do |r|
		puts "[#{k}] Prime:[#{r[:prime]}] => (#{r[:results].inspect})"
	end
end
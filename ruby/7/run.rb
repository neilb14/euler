size,take = ARGV.shift.to_i, ARGV.shift.to_i
puts "Initializing Space of Size #{size}"
bitmap = 0b1
bitmap = bitmap << size
puts "Checking"
2.upto(size).each do |current|
	puts "Checking #{current}" if current % 1000 == 0
	current.downto(2).each do |x|
		eliminate = current*x
		next if eliminate > size
		mask = 0b1
		mask = mask << eliminate-1
		bitmap = bitmap | mask
	end
end
puts "Done sieve."
results = []
1.upto(size).each do |i|
	mask = bitmap >> 1
	mask = mask << 1
	results << i if bitmap ^ mask == 0
	break if results.length > take
	bitmap = bitmap >> 1
end
puts "We have #{results.length} results."
puts "Result #{take}: #{results[take]}"
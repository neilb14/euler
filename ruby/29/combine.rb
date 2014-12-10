n = ARGV.shift.to_i
results = {}
for a in 2..n 
	for b in 2..n
		c = a**b
		results[c] = true unless results[c]
	end
end
puts results.keys.length
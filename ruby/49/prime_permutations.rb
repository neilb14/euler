require 'prime'

def prime_permuatations_of(n)
	results = []
	n.to_s.chars.permutation.map{|p| p.join('').to_i }.each do |p|
		next unless Prime.prime? p
		next unless p >= 1000
		results << p
	end
	results.sort
end

def sequences_in(p)
	map = {}
	for i in 0..(p.length-1)
		for j in (i+1)..(p.length-1)
			diff = p[j]-p[i]
			next if diff <= 0
			if map[diff]
				if map[diff].last == p[i]
					map[diff] << p[j]
				elsif	map[diff].last + diff == p[i]
					map[diff] << p[i]
					map[diff] << p[j]
				end
			else
				map[diff] = []
				map[diff] << p[i]
				map[diff] << p[j]
			end
		end
	end
	results = []
	map.each do |k,v|
		next unless v.length >= 3
		results << Array.new(v.uniq)
	end
	return results
end

results = {}
for n in 1000..9999
	next unless Prime.prime? n
	p = prime_permuatations_of(n).uniq
	next unless p.length >= 3
	sequence = sequences_in(p)
	next unless sequence.length > 0
	result = sequence.join('') 
	results[result] = 0 unless results[result]
	results[result] += 1
end

results.each_key {|k| puts k}
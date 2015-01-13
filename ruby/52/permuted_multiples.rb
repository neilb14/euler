def same_digits(a,b)
	map = {}
	a.to_s.chars.each do |c|
		map[c]=0 unless map[c]
		map[c]+=1
	end
	b.to_s.chars.each do |c|
		return false unless map[c]
		map[c]-=1
	end
	map.values.all?{|v| v==0}
end

n = 0
while(true)
	n+=1
	next unless same_digits(n, 2*n)
	next unless same_digits(n, 3*n)
	next unless same_digits(n, 4*n)
	next unless same_digits(n, 5*n)
	next unless same_digits(n, 6*n)
	puts n
	exit
end
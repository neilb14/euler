def fac(i)
	return 1 if i <= 1
	i.downto(1).inject(:*)
end

def selections(n,r)
	fac(n)/(fac(r)*fac(n-r))
end

count = 0
for n in 23..100
	for r in 1..n
		count+=1 if selections(n,r) > 1_000_000
	end
end
puts count
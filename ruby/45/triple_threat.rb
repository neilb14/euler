def triangle(n)
	(n**2+n)/2
end

def pentagonal(n)
	(3*n**2-n)/2
end

def hexagonal(n)
	(2*n**2-n)
end

tn,pn,hn,last_pentagon,last_hexagon,count=1,1,1,0,0,0
while count < 2
	tn+=1
	t = triangle(tn)
	while(last_pentagon < t)
		last_pentagon = pentagonal(pn)
		pn+=1
	end
	next unless last_pentagon == t
	while(last_hexagon < t)
		last_hexagon = hexagonal(hn)
		hn+=1
	end
	next unless last_hexagon == t
	count+=1
	puts "[#{count}] #{tn} => #{t} (Pn = #{pn}, Hn = #{hn})"
end

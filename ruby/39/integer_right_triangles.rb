def solutions(p)
	results=[]
	for x in 1..p
		for y in x..(p-x)
			z = Math.sqrt(x**2+y**2)
			results << {x:x,y:y,z:z} if x+y+z==p
		end
	end
	results.count
end

champion = {p:0,count:0}
for p in 120..1000
	puts "== #{p}" if p%100==0
	count = solutions(p)
	if count > champion[:count]
		champion = {p:p,count:count}
		puts "New champ #{p} (#{count})"
	end
end
puts "Answer: #{champion[:p]} has #{champion[:count]} results"
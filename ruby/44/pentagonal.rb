
@pentagons=[1]
def pentagonal(n)
	n*(3*n-1)/2.0
end

def is_pentagonal?(p)
	while @pentagons.last <= p
		@pentagons << pentagonal(@pentagons.length)
	end
	@pentagons.include?(p)
end

i=0
while(true)
	i+=1
	for j in 1..(i-1)
		a,b = pentagonal(i),pentagonal(j)
		next unless is_pentagonal?(a+b)
		next unless is_pentagonal?((a-b).abs)
		puts "[#{i},#{j}] => [#{a},#{b}] Value of D = #{(a-b).abs}"
		exit
	end
end

@pentagons=[1]
def pentagonal(n)
	n*(3*n-1)/2.0
end

def is_pentagonal(p)
	while @pentagons.last <= p
		@pentagons << pentagonal(@pentagons.length)
	end
	@pentagons.include?(p)
end

while(p = ARGV.shift)
	puts "#{p} [#{is_pentagonal(p.to_i)}]"
end
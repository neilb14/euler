generate_triangle = -> (n) {n*(n-1)/2}
generate_square = -> (n) {n**2}
generate_pentagonal = -> (n) {n*(3*n-1)/2}
generate_hexagonal = -> (n) {n*(2*n-1)}
generate_heptagonal = -> (n) {n*(5*n-3)/2}
generate_octagonal = -> (n) {n*(3*n-2)}

@polygonal = {last:1009, check:{}}
@triangle = {last:0, results:[], generator: generate_triangle}
@square = {last:0, results:[], generator: generate_square}
@pentagonal = {last:0, results:[], generator: generate_pentagonal}
@hexagonal = {last:0, results:[], generator: generate_hexagonal}
@heptagonal = {last:0, results:[], generator: generate_heptagonal}
@octagonal = {last:0, results:[], generator: generate_octagonal}

def is_polygonal_of_type?(n, type)
	return true if type[:results].include?(n)
	while(type[:results].length ==0 or type[:results].last < n)
		generate = type[:last] +1 
		result = type[:generator].call(generate)
		type[:last] = generate
		type[:results] << result
		return true if result == n
	end
	false
end

def is_cyclic?(set)
	m = set.length - 1
	(0..m).each do |i|
		return false unless set[i].to_s[-2,2] == set[(i+1)%m].to_s[0,2]
	end
	return true
end

def is_polygonal?(num)
	puts "is_polygonal?(#{num}) [#{@polygonal[:check][num]}]"
	return @polygonal[:check][num] unless @polygonal[:last] < num 
	while(@polygonal[:last] < num)
		print "is_polygonal?(#{num}) not sure... "
		n = @polygonal[:last] + 1
		result = is_polygonal_of_type?(n, @triangle) or is_polygonal_of_type?(n, @square) or is_polygonal_of_type?(n,@pentagonal) or is_polygonal_of_type?(n,@hexagonal) or is_polygonal_of_type?(n,@heptagonal) or is_polygonal_of_type?(n,@octagonal)
		print " [#{n}] [#{result}]"
		@polygonal[:last] = n
		@polygonal[:check][n] = result
		puts
		return true if result
	end
	return false
end

def is_each_polygonal_type_represented?(set)
	return false unless set.length == 6
	is_triangle, is_square, is_pentagonal, is_hexagonal, is_heptagonal, is_octagonal = false,false,false,false,false,false
	for num in set
		is_triangle = is_polygonal_of_type?(num, @triangle) unless is_triangle
		is_square = is_polygonal_of_type?(num, @square) unless is_square
		is_pentagonal = is_polygonal_of_type?(num,@pentagonal) unless is_pentagonal
		is_hexagonal = is_polygonal_of_type?(num,@hexagonal) unless is_hexagonal
		is_heptagonal = is_polygonal_of_type?(num,@heptagonal) unless is_heptagonal
		is_octagonal = is_polygonal_of_type?(num,@octagonal) unless is_octagonal
	end
	is_triangle and is_square and is_pentagonal and is_hexagonal and is_heptagonal and is_octagonal
end

i=1010
while(i <= 9999)
	b = (i.to_s[-2,2] + "10").to_i
	while(is_polygonal?(i) and b <= (i.to_s[-2,2] + "99").to_i)
		c = (b.to_s[-2,2] + "10").to_i
		while(is_polygonal?(b) and c <= (b.to_s[-2,2] + "99").to_i)
			d = (c.to_s[-2,2] + "10").to_i
			while(is_polygonal?(c) and d <= (c.to_s[-2,2] + "99").to_i)
				e = (d.to_s[-2,2] + "10").to_i
				while(is_polygonal?(d) and e <= (d.to_s[-2,2] + "99").to_i)
					f  = (e.to_s[-2,2] + i.to_s[0,2]).to_i
					if(is_polygonal?(e) and is_polygonal?(f))
						set = [i,b,c,d,e,f]
						puts set.inspect
						if is_each_polygonal_type_represented?(set)
							puts "RESULT = [#{set.reduce(:+)}] " + set.inspect
							exit
						end
					end
					e+=1
				end
				d += 1
			end
			c += 1
		end
		b+=1
	end
	i+=1
end
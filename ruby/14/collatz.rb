
start = ARGV.shift.to_i
champion = nil
start.downto(1).each do |i|
	count,num = 1,i
	while(i > 1)
		i % 2 == 0 ? i = i/2 : i = 3*i +1
		count+=1
	end
	champion = {count:count, num:num} unless !champion.nil? and champion[:count] > count	
end
puts champion.inspect
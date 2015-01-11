require 'prime'
upbound = ARGV.shift.to_i
i,champion=0,{count:0}
while(i < 10)
	sum,count = 0,0
	Prime.each(upbound).drop(i).each do |p|
		count+=1
		sum+=p
		break if sum >= upbound
		if count > champion[:count] and Prime.prime? sum
			puts "[#{i}] New Champ: #{sum} (#{count})"
			champion[:count] = count
			champion[:sum] = sum
		end
	end
	i+=1
end

puts champion.inspect
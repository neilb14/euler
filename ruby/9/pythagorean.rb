1.upto(1000).each do |a|
	2.upto(1000).each do |b|
		c = Math.sqrt(a*a+b*b)
		if a+b+c == 1000
			puts "#{a} #{b} #{c} => #{a*b*c}"
			exit
		end
	end
end



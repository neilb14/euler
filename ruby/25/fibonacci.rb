term,current = 2,[1,1]
while(current[1].to_s.length < 1000)
	value = current[0] + current[1]
	current[0] = current[1]
	current[1] = value
	term+=1
end
puts "#{term} => #{value}"
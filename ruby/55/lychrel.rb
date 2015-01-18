def palindrome?(n)
	n == n.to_s.chars.reverse.join('').to_i
end

count = 0
for n in 1..9999
	i,x=0,n
	while(i<=50)
		i+=1
		y = x.to_s.chars.reverse.join('').to_i
		x+=y
		if palindrome?(x)
			count += 1
			break
		end
	end
end
puts "There are #{9999-count} Lychrel numbers"
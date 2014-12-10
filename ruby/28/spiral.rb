n = ARGV.shift.to_i
sum,i,width,pass = 1,3,2,1
while(i <= n*n)
	sum+=i
	width += 2 if pass % 4 == 0 
	i+=width
	pass+=1
end
puts sum
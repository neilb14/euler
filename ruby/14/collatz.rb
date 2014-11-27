i = ARGV.shift.to_i
print i.to_s + ' '
while(i > 1)
	i % 2 == 0 ? i = i/2 : i = 3*i +1
	print i.to_s + ' '
end
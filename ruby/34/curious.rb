@memoize = {0=>0}
def factorial(i)
	return @memoize[i] if @memoize[i]
	result = (1..i).inject(:*)
	@memoize[i] = result
	result
end

for n in 3..99999999	
	sum,num = 0,n.to_s
	print num + " " if n%100000==0
	num.each_char do |c|
		sum += factorial(c.to_i)
	end
	if num == sum.to_s
		puts "#{num} == #{sum}"
	end
end

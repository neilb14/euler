@memoize = {0=>1}  #ouch 0!=1 not 0 :-)
def factorial(i)
	return @memoize[i] if @memoize[i]
	result = (1..i).inject(:*)
	@memoize[i] = result
	result
end

(1..9).each {|n| factorial n }
puts @memoize.inspect

is_done,result = {},-3
for n in 1..10
	limit = n*factorial(9)
	@memoize.keys.repeated_permutation(n).each do |c|
		num = c.join('').to_i
		next if num > limit or is_done[num]
		sum = 0
		num.to_s.each_char {|k|sum+= @memoize[k.to_i]}
		if sum.to_s == num.to_s
			result += sum
			puts c.inspect + " " + sum.to_s + " (#{result})"
		end
		is_done[num] = true
	end
end
puts result
exit
for n in 3..99999999
	sum,num = 0,n.to_s
	print num + " " if n % 100000==0
	num.each_char do |c|
		sum += factorial(c.to_i)
	end
	if num == sum.to_s
		puts "#{num} == #{sum}"
	end
end

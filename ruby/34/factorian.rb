#http://mathworld.wolfram.com/Factorion.html

def factorial(i)
	return 1 if i==0
	(1..i).inject(:*)
end

result = 0
for n in 3..50_000
	sum = 0
	n.to_s.each_char {|c| sum+=factorial(c.to_i) }
	result += sum if sum.to_s == n.to_s
end
puts result
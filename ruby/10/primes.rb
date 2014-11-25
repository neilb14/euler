require 'prime'
n,sum = ARGV.shift.to_i,0
Prime.each(n) do |prime|
	sum += prime
end
puts sum
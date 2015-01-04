require 'prime'

def check(n)
	Prime.each do |p|
		return false if p > n
		next unless (n-p) % 2.0 == 0
		next unless Math.sqrt((n-p)/2.0) % 1 == 0
		return true
	end
end

n=9
while true
	if Prime.prime?(n) or check(n)
		n+=2
	else
		puts n
		exit
	end
end
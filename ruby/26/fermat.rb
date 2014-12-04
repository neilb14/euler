# http://oeis.org/A051626
require 'prime'

def A051626(n)
	lpow = 1
	while true
		(lpow-1).downto(0).each do |mpow|
			if (10**lpow-10**mpow) % n == 0
				return lpow-mpow
			end
		end
		lpow+=1
	end
end

challenger,champion,champion_d = 0,6,7
primes = Prime.take(1000)
while(challenger < 1000)
	challenger = primes.shift
	next if challenger <= 7
	result = A051626(challenger)
	next if result <= champion
	champion = result
	champion_d = challenger
end

puts "Champion: #{champion_d} => #{champion} thank you Fermat!"
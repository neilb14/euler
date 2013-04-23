require 'mathn'
primes = Prime.new
puts 0.upto(2_000_000).inject(0){|sum,n|sum+primes.next}

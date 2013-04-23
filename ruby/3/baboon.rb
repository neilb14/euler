number = 600851475143
challenger = number
champion = number
while champion >= number
	champion = challenger if number%challenger==0
	challenger = challenger - 1
end
puts champion

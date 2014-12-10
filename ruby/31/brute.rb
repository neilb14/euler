@count=1
def reduce(remainder, coins)
	if remainder <= 0 or coins.length <= 0
		@count+=1
		return 0
	end
	for x in 0..(remainder/coins[0])
		reduce(remainder-x*coins[0],coins[1,coins.length])
	end
end
coins = [100,50,20,10,5,2]
reduce(200,coins)
puts @count
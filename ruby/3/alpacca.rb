number = 68
champion = 1
(2..number-1).each do |n|
	champion = n if (number/n)*n ==number
end
puts champion

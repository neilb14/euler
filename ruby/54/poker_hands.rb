def card_value(card)
	map = {'T' => 10,'J' => 11,'Q' => 12,'K' => 13,'A' => 14}
	value = card.chars.first
	if value =~ /\d/
		return value.to_i
	else
		return map[value]
	end
end

def royal_flush(hand)
	return 0 unless hand[:suits] == 1
	return 0 unless hand[:values].keys.length == 5
	return 0 unless hand[:values].keys.include? 10
	return 0 unless hand[:values].keys.include? 11
	return 0 unless hand[:values].keys.include? 12
	return 0 unless hand[:values].keys.include? 13
	return 0 unless hand[:values].keys.include? 14
	return 14
end

def straight_flush(hand)
	return 0 unless hand[:suits] == 1
	straight(hand)
end

def four_of_a_kind(hand)
	return 0 unless hand[:values].keys.length == 2
	hand[:values].each_pair do |value,cards|
		return value if cards.length == 4
	end
	0
end

def	full_house(hand)
	return 0 unless hand[:values].keys.length == 2
	results = {}
	hand[:values].each_pair {|k,v| results[v.length] = k }
	return 0 if results[3].nil? or results[2].nil?
	results[3]
end

def flush(hand)
	return 0 unless hand[:suits] == 1
	return hand[:values].keys.sort.last
end

def straight(hand)
	return 0 unless hand[:values].keys.length == 5
	last = 0
	hand[:values].keys.sort.each do |v|
		if last > 0
			return 0 unless last+1 == v or (last == 5 and v == 14)
		end
		last = v
	end
	last
end

def three_of_a_kind(hand)
	hand[:values].each_pair do |value, cards|
		return value if cards.length == 3
	end
	0
end

def two_pairs(hand)
	count, champ = 0,0
	hand[:values].each_pair do |value, cards|
		if cards.length == 2
			count+=1
			champ = value unless champ > value
		end
	end
	return 0 unless count == 2
	return champ
end

def one_pair(hand)
	count,champ = 0,0
	hand[:values].each_pair do |value, cards|
		if cards.length == 2
			count+=1
			champ = value unless champ > value
		end
	end
	return 0 unless count == 1
	return champ
end

def high_card(hand)
	champ = 0
	hand[:values].each_pair do |value, cards|
		next if cards.length > 1
		champ = value unless champ > value
	end
	champ
end

def score(hand)
	results = []
	results << royal_flush(hand)
	results << straight_flush(hand)
	results << four_of_a_kind(hand)
	results << full_house(hand)
	results << flush(hand)
	results << straight(hand)
	results << three_of_a_kind(hand)
	results << two_pairs(hand)
	results << one_pair(hand)
	results << high_card(hand)
	results
end

def won_by(i)
	results = []
	results << :royal_flush
	results << :straight_flush
	results << :four_of_a_kind
	results << :full_house
	results << :flush
	results << :straight
	results << :three_of_a_kind
	results << :two_pairs
	results << :one_pair
	results << :high_card
	results[i]
end

def hand(cards)
	{cards:cards, values:cards.group_by{|c| card_value c}, suits:cards.group_by{|c| c.chars.last }.keys.length}
end

wins,total,remainder = 0,0,0
File.open(ARGV.shift, 'r').each_line do |l|
	total+=1
	cards = l.split(/\s+/)
	h1,h2 = hand(cards[0,5]),hand(cards[5,5])
	print "#{h1[:cards].inspect} vs #{h2[:cards].inspect} "
	player1,player2 = score(hand(cards[0,5])), score(hand(cards[5,5]))
	for i in 0..(player1.length-1)
		print "[#{won_by(i)}:#{player1[i]}:#{player2[i]}]" unless player1[i] == 0 and player2[i] == 0
		if player1[i] > player2[i]
			wins+=1
			puts "	"
			break
		elsif player2[i] > player1[i]
			remainder +=1
			puts "  ==> 2:#{won_by(i)}"
			break
		end
	end
end
raise "Wins: #{wins} Remainder: #{remainder} Total: #{total}" unless total - wins == remainder
puts "Player 1 won #{wins} of #{total} hands (#{remainder})"
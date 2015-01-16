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
	hand[:values].values.each {|v| results[v.length] }
	return 0 if results[3].nil? or results[2].nil?
	return hand[:values].keys.sort.last
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
			return 0 unless last-1 == v
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
	hand[:values].keys.sort.last
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

def hand(cards)
	{cards:cards, values:cards.group_by{|c| card_value c}, suits:cards.group_by{|c| c.chars.last }.keys.length}
end

wins = 0
File.open('sample.txt', 'r').each_line do |l|
	cards = l.split(/\s+/)
	h = hand(cards[0,5])
	puts h.inspect + " #{h[:values].keys.sort.last}" unless h[:suits] > 2
	player1,player2 = score(hand(cards[0,5])), score(hand(cards[5,5]))
	for i in 0..(player1.length-1)
		wins+=1 if player1[i] > player2[i]
	end
end

puts "Player 1 won #{wins} hands"
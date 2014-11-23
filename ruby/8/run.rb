window_size = ARGV.shift.to_i
champion_product, champion_window, current_window = 0, [], []


File.open('data.txt', 'r').each_line do |line|
	line.chomp!
	0.upto(line.length-1).each do |i|
		current_window.shift unless current_window.length < window_size
		current_window << line[i].to_i
		challenger_product = 1
		current_window.each {|x| challenger_product = challenger_product * x}
		if challenger_product > champion_product
			champion_product = challenger_product
			champion_window = Array.new(current_window)
		end
	end
end

puts "#{champion_product} => #{champion_window.inspect}"
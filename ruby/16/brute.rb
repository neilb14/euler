class Brute
	def self.run(pow)
		count = 1
		result = 1
		while count<=pow
			result *= 2
			count += 1
		end
		sum = 0
		result.to_s.each_char {|c| sum+=c.to_i}
		sum
	end
end
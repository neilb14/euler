class Words
	def self.run(number)
		primary = {1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=> "five", 6 => "six", 7=>"seven", 8=> "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 19=>"nineteen",20=>"twenty",30=>"thirty",40=>"forty", 50=>"fifty", 60=>"sixty", 70=>"seventy", 80=>"eighty", 90=>"ninety"}
		thousands = number/1000
		number = number%1000
		hundreds = number/100
		number = number%100
		if number >= 20
			tens = number/10
			number = number%10
		else
			tens = 0
		end
		word = ""
		word += primary[thousands] + "thousand" unless thousands <= 0
		word += primary[hundreds] + "hundred" unless hundreds <= 0
		word += "and" unless hundreds <= 0 or (tens <= 0 and number <= 0)
		word += primary[tens*10] unless tens <= 0 
		word += primary[number] if number > 0
		word
	end

	def self.count(number)
		count = 0
		number.each_char {|c| count+=1 if c =~ /\w/ }
		count
	end
end
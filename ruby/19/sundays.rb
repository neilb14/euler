require 'date'
class Sundays
	def find(end_date)
		@start_date = Date.new(1901,1,1)
		@current = Date.new(1900,1,1)
		@day_index = 1
		@count = 0	
		while @current <= end_date
			@current = @current + 1
			@day_index += 1
			next unless @current >= @start_date
			next unless @current.day == 1
			next unless @day_index % 7 == 0
			@count+=1
			puts "#{@count}: #{@current}"
		end
		@count
	end
end
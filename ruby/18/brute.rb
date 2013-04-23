class Brute
	attr_accessor :data, :champion
	def initialize(data)
		@data = data
		@champion = 0
	end

	def self.create(filename)
		data = []
		File.open(filename, 'r') do |file|			
			while(line = file.gets)
				row = []
				line.split(' ').each {|weight| row << weight.to_i }
				data << row
			end			
		end
		Brute.new(data)
	end

	def start
		last_row_index = data.length - 1
		routes = [Route.new(0, data[0][0])]
		1.upto(last_row_index).each do |row|
			next_routes = []
			routes.each do |r|
				r.split(data[row][r.left_index], data[row][r.right_index]).each {|n| next_routes << n}
			end
			routes = next_routes
		end
		@champion=  routes.first
		routes.each do |challenger|
			@champion = challenger unless challenger.sum <= champion.sum
		end
		@champion.sum
	end
end

class Route
	attr_accessor :sum, :index

	def initialize(index, seed)
		@index = index
		@sum = seed
	end

	def split(left, right)
		[Route.new(left_index, left+@sum), Route.new(right_index, right+@sum)] 
	end

	def left_index
		return @index
	end

	def right_index
		return @index+1
	end
end
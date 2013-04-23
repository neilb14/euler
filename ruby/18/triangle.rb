class Triangle
	attr_accessor :data, :size

	def initialize(data)
		@data = data
		@last_row_index = data.length-1
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
		Triangle.new(data)
	end

	def start()		
		challenge(@data[@last_row_index][0], @last_row_index-1)
	end

	def challenge(champion, row_index)		
		return champion if row_index < 0
		champion = champion+@data[row_index][0]
		challenger = 0
		col_index=0
		(row_index).upto(@last_row_index) do |i|
			challenger += @data[i][col_index]			
			col_index+=1
		end
		champion = [champion, challenger].max
		challenge(champion, row_index-1)
	end
end
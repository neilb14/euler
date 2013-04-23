class Smart
	attr_accessor :size, :count

	def initialize(size)
		@count = 0
		@size = size
	end

	def calculate()
		@size*(@size+1)	
	end

	def self.routes(size)
		Smart.new(size).calculate()
	end
end
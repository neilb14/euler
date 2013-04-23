class Routes
	attr_accessor :size, :count
	def initialize(size)
		@size = size
		@memos = Hash.new()
	end

	def walk(x,y)
		return @memos[[x,y]] if @memos[[x,y]]
		if x==@size and y==@size			
			return 1
		end
		memo = 0
		memo += walk(x+1,y) unless x+1 > @size
		memo += walk(x,y+1) unless y+1 > @size
		@memos[[x,y]] = memo
		return memo
	end

	def self.through_matrix(size)
		result = Routes.new(size)
		result.walk(0,0)
	end
end
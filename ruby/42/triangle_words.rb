@triangles = [1]
def convert(c)
	'-abcdefghijklmnopqrstuvwxyz'.index(c.downcase)
end

def triangle(n)
	0.5*(n**2+n)
end

def is_triangle_word?(nums)
	sum = nums.reduce(:+)
	return true if @triangles.include?(sum)
	return false if @triangles.last > sum
	while(@triangles.length < 26)
		result = triangle(@triangles.length)
		@triangles << result
		return true if result == sum
	end
	false
end

words,count = [],0
words << ARGV.shift if ARGV.length > 0
if words.length <= 0
	words = File.open('p042_words.txt','r').read.split(',').select{|w| w =~ /\w*/}.map{|w| w.gsub(/\"/,'')}
end
for word in words
	if is_triangle_word?(word.each_char.map {|c| convert(c)})
		count+=1
		puts "#{word} is a triangle word."
	end
end
puts "There are #{count} triangle words."

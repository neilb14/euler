letters = File.read(ARGV.shift).split(',')

crypts = [['g'.ord, 'o'.ord, 'd'.ord]]
#for a in 'a'.ord..'z'.ord
#	for b in 'a'.ord..'z'.ord
#		for c in 'a'.ord..'z'.ord
#			crypts << [a,b,c]
#		end
#	end
#end

count,sum = 1,0
for crypt in crypts
	password = crypt[0].chr + crypt[1].chr + crypt[2].chr
	result = ""
	for i in 0..(letters.length-1)
		decrypted = letters[i].to_i ^ crypt[i%crypt.length].ord 
		sum += decrypted
		result += decrypted.chr
	end
	#next if result =~ /\d/
	#next if result =~ /[[:cntrl:]]/
	#next if result =~ /[\+\.\?\{\}\:\;=\[\]\<\>\#\@\%\$\*\&\^\!]/
	puts "[#{sum}] #{password}| #{result}"
end


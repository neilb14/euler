alphabet = {A:1,B:2,C:3,D:4,E:5,F:6,G:7,H:8,I:9,J:10,K:11,L:12,M:13,N:14,O:15,P:16,Q:17,R:18,S:19,T:20,U:21,V:22,W:23,X:24,Y:25,Z:26}
names = []
File.open('p022_names.txt','r').each_line do |line|
	line.split(",").each do |name|
		names << name.gsub(/"/,'')
	end
end
result = 0
names.sort!
for i in 0..names.length
	next if names[i].nil?
	sum = 0
	names[i].each_char do |c|
		sum += alphabet[c.to_sym]
	end
	result += (i+1)*sum
end
puts result
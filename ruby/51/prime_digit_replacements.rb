require 'prime'

start,upbound = ARGV.shift.to_i, ARGV.shift.to_i

def distance(a,b)
	raise "Arrays are different lengths #{a.length} != #{b.length} in distance" unless a.length == b.length
	set_mask,mask = 1,0
	for i in 0..(a.length-1)
		mask = (mask|set_mask) unless a[i].to_i != b[i].to_i
		set_mask*=2
	end
	mask
end

def matching_with_mask(mask,a,b)
	raise "Array lengths do not match #{a.length} != #{b.length}" unless a.length == b.length
	test = 1
	while(a.length > 0)
		x,y = a.shift, b.shift
		if (mask&test) == 1 and x!=y
			return false
		end
		test*=2
	end
	true
end

def wildcards_are_same(mask, a)
	test,wild,copy_a,original = 1,nil,Array.new(a),a.join('').to_i
	while(copy_a.length > 0)
		x = copy_a.shift
		if (mask&test)==0
			if wild.nil?
				wild = x
			elsif wild != x
				return false
			end
		end
		test*=2
	end
	true
end

def display(mask,a)
	copy_a,test,result = Array.new(a),1,""
	while(copy_a.length > 0)
		x = copy_a.shift
		if (mask&test)==test
			result << x
		else
			result << "*"
		end
		test*=2
	end
	result
end


map,primes,masks,champion = {},Prime.each,{},{count:0}
Prime.each(upbound) do |p|
	next if p < start
	length = p.to_s.length
	map[length] = [] unless map[length]
	map[length] << p.to_s.chars
end
while(champion[:count] <= 8)
	p = primes.first
	next if p < start
	exit if p > upbound
	digits = p.to_s.chars
	masks = {}
	map[digits.length].each do |other|
		result = distance(other, digits)
		next unless result > 0
		next unless wildcards_are_same(result, other) and wildcards_are_same(result, digits)
		masks[result] = [] unless masks[result]
		masks[result] << other
	end
	masks.keys.sort.each do |k|
		results = [p]
		masks[k].each do |other|
			#print "[#{p}] Checking [#{other.join('')}] with mask [#{display(k, digits)}]"
			if matching_with_mask(k, Array.new(other), Array.new(digits))
				results << other.join('').to_i
				#print " => SUCCESS"
			else
				#print " => FAIL"
			end
			#puts " #{results.length}"
		end
		if results.length > champion[:count]
			puts "New Champ! [#{results.length}] #{display(k,digits)} => (#{results.sort.join(',')})"
			champion = {count: results.length, list:results, pattern: display(k,digits), mask: k}
		end
	end
end
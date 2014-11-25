horizontal_runs, vertical_runs, diag_runs = [],Array.new(20),[]
row = 0
File.open('data.txt','r').each_line do |line|
	run,col,row = [],0
	line.chomp!.split(' ').each do |x|
		run << x.to_i
		vertical_runs[col] = [] unless vertical_runs[col]
		vertical_runs[col] << x.to_i
		col+=1
	end
	horizontal_runs << run
	row+=1
end
i =0
(horizontal_runs + vertical_runs).each do |run|
	puts i.to_s + " " + run.inspect
	i+=1
end


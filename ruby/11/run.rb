# One pass through the file to collect out the runs
horizontal_runs, vertical_runs, forward_diag_runs, backward_diag_runs = [],Array.new(20),[],[]
row = 0
File.open('data.txt','r').each_line do |line|
	run,col = [],0
	line.chomp!.split(' ').each do |x|
		run << x.to_i
		vertical_runs[col] = [] unless vertical_runs[col]
		vertical_runs[col] << x.to_i
		forward_diag_index = col-row
		forward_diag_index = -1*forward_diag_index+19 if forward_diag_index < 0
		forward_diag_runs[forward_diag_index] = [] unless forward_diag_runs[forward_diag_index]
		forward_diag_runs[forward_diag_index] << x.to_i
		backward_diag_index = col+row
		backward_diag_runs[backward_diag_index] = [] unless backward_diag_runs[backward_diag_index]
		backward_diag_runs[backward_diag_index] << x.to_i
		col+=1
	end
	horizontal_runs << run
	row+=1
end

# Now champion-challenger over all runs to find the true winner
champion, count = 0, 0
(horizontal_runs + vertical_runs + backward_diag_runs+forward_diag_runs).each do |run|
	next if run.length < 4
	for i in 0..(run.length - 4)
		challenger = run[i]*run[i+1]*run[i+2]*run[i+3]
		if challenger > champion 
			champion = challenger
		end
	end
	count+=1
end
puts champion
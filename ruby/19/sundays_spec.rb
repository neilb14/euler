require './sundays'

describe 'Sundays' do
	it 'had two sundays landing on the first of the month in 1901' do
		Sundays.new.find(Date.new(1901,12,31)).should == 2
	end

	it 'had 171 sundays landing on the first of the month between 1901 and 2000' do
		Sundays.new.find(Date.new(2000,12,31)).should == 171
	end
end
require './brute'

describe "Brute" do
	it "should calculate 2^15" do
		Brute.run(15).should == 26
	end

	it "should calculate 2^1000" do
		Brute.run(1000).should == 1366
	end
end
require './routes'
require './smart'
describe "routes" do
	it "should count the routes for a 2x2 matrix" do
		Routes.through_matrix(2).should == 6
	end

	it "should count the routes for a 4x4 matrix" do
		Routes.through_matrix(4).should == 70
	end

	it "should count the routes for a 20x20 matrix" do
		Routes.through_matrix(20).should == 420	
	end
end

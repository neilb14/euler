require './triangle'

describe "Triangle" do
	it "Should create a triangle from the specified file" do
		result = Triangle.create("triangle1.txt")
		result.should_not be_nil
	end

	it "Should calculate the sum of a trivial triangle" do
		result = Triangle.new([[5],[7,3]])
		result.start.should == 12
	end

	it "Should calculate the sum of a larger triangle" do
		result = Triangle.new([[5],[7,3],[1,2,9]])
		result.start.should == 17
	end

	it "Should calculate the sum of a larger triangle" do
		result = Triangle.create("triangle1.txt")
		result.start.should == 23
	end


	it "Should calculate the sum of a larger triangle" do
		result = Triangle.create("triangle2.txt")
		result.start.should == 23
	end
end
require './words'

describe "Words" do
	it "should require 3 letters to write the number 1" do
		Words.run(1).should == 'one'
	end

	it "should require 4 letters to write the number 5" do
		Words.run(5).should == 'five'
	end

	it "should require 9 letters to write the number 21" do
		Words.run(21).should == 'twentyone'
		Words.count(Words.run(21)).should == 9
	end

	it "should require write the word seventy seven" do
		Words.run(77).should == 'seventyseven'
		Words.count(Words.run(77)).should == 12
	end

	it "should write the the word one hundred" do
		Words.run(100).should == 'onehundred'
	end

	it "should write the the word one hundred and one" do
		Words.run(101).should == 'onehundredandone'
	end

	it "should write the word four hundred and eighty nine" do
		Words.run(489).should == 'fourhundredandeightynine'
	end

	it "should count 23 letters for 342" do
		word = Words.run(342)
		word.should == 'threehundredandfortytwo'
		Words.count(word).should == 23
	end

	it "should write the word one thousand" do
		Words.run(1000).should == 'onethousand'
	end

	it "should count all letters used from one to one thousand" do
		result = 0
		1.upto(1000).each do |i| 
			word = Words.run(i)
			count = Words.count(word)
			result += count
			p "[#{i}] #{word}  => #{count} [#{result}]"
		end
		puts result
	end
end
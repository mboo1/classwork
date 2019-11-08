require 'rspec'
require 'tdd'


#[1, 2, 1, 3, 3].uniq # => [1, 2, 3]
describe "#my_uniq" do
  subject(:array) {[1,2,1,3,3]}
  it "should raise ArgumentError if not passed an array" do
    expect{"a".my_uniq}.to raise_error(NoMethodError)
  end  

  it "should return a new array containing unique elements" do
    expect(array.my_uniq).to eq([1,2,3])
  end
end

describe "#two_sum" do
  let(:array) { [-1, 1, -2, 2] }

  it "should return an array of arrays where values at indices add to zero" do
    expect(array.two_sum).to eq([ [0,1], [2,3] ])
  end

  it "should raise ArgumentError if not passed an array" do
    expect{"a".two_sum}.to raise_error(NoMethodError)
  end
  
end

describe "#my_transpose" do
  subject(:array) {[[1,2,3],[4,5,6],[7,8,9]]}

  it "should return a 2-D array where the receiver's rows are the columns of the returned array" do
    expect(array.my_transpose).to eq([[1,4,7],[2,5,8],[3,6,9]])
  end
  
  it "should raise NoMethodError if not passed an array" do
    expect{"a".my_transpose}.to raise_error(NoMethodError)
  end
  
end

describe "stock_picker" do

  it "should give the most profitable result of buying a stock and on a later day selling it" do
    expect(stock_picker([10, 3, 9, 1, 2] )).to eq([1,2])
    expect(stock_picker([1, 3, 9, 10, 2] )).to eq([0,3])
    expect(stock_picker([1, 3, 9, 10, 2] )).to_not eq([3,0])
    expect(stock_picker([5,4,3,2])).to eq(nil)
  end

  it "should return nil if the argument is not an array of at least size 1" do
    expect(stock_picker([10])).to eq(nil)
    expect(stock_picker([])).to eq(nil)
  end

  it "should raise NotAnArrayError if not passed an array" do
    expect{stock_picker('a')}.to raise_error(ArgumentError)
  end

end

describe TowersOfHanoi do
  subject(:towers){TowersOfHanoi.new([[4,5],[2,3],[1]])}
  let(:towers2) {TowersOfHanoi.new([[4,5],[1,2,3],[]])}
  describe "#move" do 
    it "should properly move a smaller disc to a pile with a larger disc" do
      expect(towers.move([2,1])).to eq([[4,5],[1,2,3],[]])
    end
    it "properly handles invalid moves" do
      expect(towers.move([199,5])).to eq([[4,5],[2,3],[1]])
      expect(towers.move([2,2])).to eq([[4,5],[2,3],[1]])
      expect(towers2.move([2,1])).to eq([[4,5],[1,2,3],[]])
    end
  end
  
end

# describe Robot do
#   subject(:robot) { Robot.new }

#   it "position should start at [0, 0]" do
#     expect(robot.position).to eq([0, 0])
#   end

#   describe "move methods" do
#     it "moves left" do
#       robot.move_left
#       expect(robot.position).to eq([-1, 0])
#     end
#   end
# end
require './lib/num_guess'

RSpec.describe VerbalSort do
  describe "#initialize" do
    before(:each) do
      @verbal_sort = VerbalSort.new(5, [1, 2, 3])
    end

    it "sets the lower bound to 0 on initialize" do
      expect(@verbal_sort.lower_bound).to eq(0)
    end
    
    it "assigns the upper bound on initialize" do
      expect(@verbal_sort.upper_bound).to eq(5)
    end

    it "assigns the instructions on intialize" do
      expect(@verbal_sort.instructions.count).to eq(3)
    end
  end
end

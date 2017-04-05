require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "James") }
  subject(:dessert) { Dessert.new("Pie", 9000, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Pie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to be_an(Integer)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Pie", "one", chef) }.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("Spinach")
      expect(dessert.ingredients).to include("Spinach")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("Kale")
      expect(dessert).to receive(:mix)
      dessert.mix
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(9000)
      dessert.eat(10)
      expect(dessert.quantity).to_not eq(9000)
    end


    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(100000) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef James the Great Baker")
      expect(dessert.serve).to include("the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with("Worms")
      chef.bake("Worms")
    end
  end
end

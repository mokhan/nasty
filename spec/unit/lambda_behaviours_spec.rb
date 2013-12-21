require "spec_helper"

module Nasty
  describe LambdaBehaviours do
    include LambdaBehaviours

    it "memoizes the lambda" do
      calculation = memoize(lambda { |x| x + rand(100) })
      first_result = calculation.call(1)
      calculation.call(1).should == first_result
      calculation.call(1).should == first_result
      calculation.call(1).should == first_result
    end
  end
end

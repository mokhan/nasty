require "spec_helper"

module Nasty
  describe Lazy do
    context "when lazy loading an item from a factory" do
      context "when invoking a method on the proxy" do
        let(:factory) { double }
        let(:blackbook) { double }

        before :each do
          blackbook.stub(:find).and_return("nasty")
          Lazy.bind_factory do |key|
            blackbook if key == :blackbook
          end
        end

        it "should invoke the target" do
          Lazy.load(:blackbook).find(:booty).should == "nasty"
        end
      end

      context "before invocation" do
        let(:factory) { ->(*args) { @called = true } }

        before :each do
          Lazy.load(:blackbook, factory)
        end

        it "does not resolve the component from the factory" do
          @called.should be_false
        end
      end
    end
  end
end

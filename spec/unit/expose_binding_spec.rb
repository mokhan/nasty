require "spec_helper"

module Nasty
  describe ExposeBinding do
    it "exposes an objects private binding" do
      item = Object.new.instance_eval do
        @message = "secret"
        self
      end
      item.extend(Nasty::ExposeBinding)
      eval("@message", item.get_binder).should == "secret"
    end
  end
end

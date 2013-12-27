require "spec_helper"

module Nasty
  describe ExposeBinding do
    it "exposes an objects private binding" do
      item = Object.new
      item.instance_eval do
        @message = "secret"
      end
      item.extend(Nasty::ExposeBinding)
      binding = item.get_binder
      result = ERB.new("<%= @message %>").result(binding)
      result.should == "secret"
    end
  end
end

require "spec_helper"

describe "using" do
  let(:item) { double("item", dispose: true) }

  it "disposes the item" do
    using(item) { }
    item.should have_received(:dispose)
  end

  it "performs the action" do
    ran = false
    using(item) do
      ran = true
    end
    ran.should be_true
  end

  it "always cleans up the resource" do
    begin
      using(item) { raise "heck" }
    rescue
    end
    item.should have_received(:dispose)
  end
end

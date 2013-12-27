require "spec_helper"

describe Logger do
  context "playtime" do
    it "should log stuff" do
      logger = Logger.new(STDOUT)
      logger.level = Logger::DEBUG

      #logger.debug("i am logged")
      #logger.close
    end
  end
end

module Nasty
  describe Log do
    context "when logging stuff" do
      let(:logger) { double("", debug: true) }
      let(:log_factory) { double }

      before :each do
        log_factory.stub(:create_for).with(self).and_return(logger)
        Log.bind_to(log_factory)
        Log.for(self).debug("hi there")
      end

      it "should log to the bound logger" do
        logger.should have_received(:debug).with("hi there")
      end
    end
  end
end

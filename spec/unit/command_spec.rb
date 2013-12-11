require "spec_helper"

module Nasty
  describe Command do
    class SimpleCommand
      include Command
      def run; @ran = true; end
      def ran?; @ran; end
    end

    class ComplexCommand < SimpleCommand
      attr_accessor :arguments

      def run(*args)
        super()
        self.arguments = args
      end
    end

    context "without parameters" do
      let(:first_command) { SimpleCommand.new }
      let(:second_command) { SimpleCommand.new }

      it "chains two commands together" do
        result = first_command.then(second_command)
        result.run
        first_command.ran?.should be_true
        second_command.ran?.should be_true
      end
    end

    context "with parameters" do
      let(:first_command) { ComplexCommand.new }
      let(:second_command) { ComplexCommand.new }

      it "forwards the input to each command" do
        result = first_command.then(second_command)
        result.run("hello world", 29)
        first_command.ran?.should be_true
        first_command.arguments.should include("hello world")
        first_command.arguments.should include(29)
        second_command.arguments.should include("hello world")
        second_command.arguments.should include(29)
      end
    end
  end
end

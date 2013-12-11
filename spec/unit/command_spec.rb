require "spec_helper"

describe Command do
  class SimpleCommand
    include Command
    def run; @ran = true; end
    def ran?; @ran; end
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
end

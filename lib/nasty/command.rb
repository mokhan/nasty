module Nasty
  module Command
    def then(next_command)
      CompositeCommand.new(self, next_command)
    end
  end
end

module Command
  def then(next_command)
    CompositeCommand.new(self, next_command)
  end
end

class CompositeCommand
  def initialize(first, last)
    @first = first
    @last = last
  end

  def run
    @first.run
    @last.run
  end
end

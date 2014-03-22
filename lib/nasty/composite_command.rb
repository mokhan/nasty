module Nasty
  class CompositeCommand
    include Command

    def initialize(first, last)
      @first = first
      @last = last
    end

    def run(*args)
      @first.run(*args)
      @last.run(*args)
    end
  end
end

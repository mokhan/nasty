module Nasty
  module Specification
    def or(other_predicate = nil, &block)
      matcher = create_predicate(other_predicate, &block)
      create_predicate { |item| self.matches?(item) || matcher.matches?(item) }
    end

    def and(other_predicate = nil, &block)
      matcher = create_predicate(other_predicate, &block)
      create_predicate { |item| self.matches?(item) && matcher.matches?(item) }
    end

    def not
      create_predicate { |item| !self.matches?(item) }
    end

    private

    def create_predicate(predicate = nil, &block)
      block_given? ? Nasty::BlockSpecification.new(&block) : predicate
    end
  end

  class BlockSpecification
    include Nasty::Specification

    def initialize(&block)
      @block = block
    end

    def matches?(item)
      @block.call(item)
    end
  end
end

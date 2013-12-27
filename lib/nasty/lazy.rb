module Nasty
  class Lazy 
    def initialize(factory = ->(key) { key.new }, *arguments)
      @factory = factory
      @arguments = arguments
    end

    def method_missing(name, *args, &block)
      @target ||= @factory.call(*@arguments)
      @target.send(name, args, &block)
    end

    class << self
      def bind_resolver(&block)
        @@factory = block
      end

      def load(key, factory = @@factory)
        Lazy.new(factory, key)
      end
    end
  end
end

require "logger"

module Nasty
  class Log
    class << self
      def bind_to(log_factory)
        @@log_factory = log_factory
      end

      def for(target)
        @@log_factory || ConsoleLogFactory.new
        @@log_factory.create_for(target)
      end
    end
  end

  class ConsoleLogFactory
    def initialize(logger = Logger.new(STDOUT), level = Logger::DEBUG)
      @logger = logger
      @logger.level = level
    end

    def create_for(target)
      @logger
    end
  end
end

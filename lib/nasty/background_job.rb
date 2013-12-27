module Nasty
  class BackgroundJob
    def initialize(process)
      @process = process
    end

    def run
      @pid = fork do
        exec @process
      end
    end

    def stop(signal = "TERM")
      if @pid
        Process.kill(signal, @pid)
        Process.wait(@pid)
      end
    end
  end
end

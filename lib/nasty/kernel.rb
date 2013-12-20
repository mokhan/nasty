module Kernel
  def using(resource, &block)
    begin
      block.call
    ensure
      resource.dispose
    end
  end
end

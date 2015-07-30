module Enumerable

	def my_each
    for i in self
      yield(i) if block_given?
    end
  end


end
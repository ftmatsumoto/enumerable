module Enumerable

	def my_each
    for i in self
      yield(i) if block_given?
    end
  end

  def my_each_with_index
    for i in (0...self.length)
      yield(self[i],i) if block_given?
    end  	
  end

  def my_select
    result_array = []
    for i in self
      result_array << i if yield(i) == true
    end
    return result_array
  end

end

print [1,2,3,4,5].select { |x| x%2==0 }
print [1,2,3,4,5].my_select { |x| x%2==0 }
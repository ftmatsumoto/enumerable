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
    self.my_each { |i| result_array << i if yield(i) == true } if block_given?
    return result_array
  end

  def my_all?
  	if block_given?
  		self.my_each { |i| return false if yield(i) == false }
  	else 
  		return false
  	end
  	true
  end

end

print [1,2,3,4,5].all? { |x| x%2==0 }
print [1,2,3,4,5].my_all? { |x| x%2==0 }
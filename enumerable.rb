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
  		self.my_each { |i| return false unless i }
  	end
  	true
  end

  def my_any?
  	if block_given?
  		self.my_each { |i| return true if yield(i) == true }
  	else
  		self.my_each { |i| return true if i }
  	end
  	false
  end

  def my_none?
  	if block_given?
      my_each { |i| return false if yield(i) }
    else
      my_each { |i| return false if i }
    end
    true
  end

  def my_count(number = nil)
  	counter = 0
  	if block_given?
      my_each { |i| counter += 1 if yield(i) }
  	elsif number.nil?
  		counter = length
  	else
      my_each { |i| counter += 1 if i == number }
  	end
  	counter
  end

  def my_map
    result_array = []
    if block_given?
      my_each do |i|
        result_array << yield(i)
      end
      return result_array
    else
      return self
    end
  end

end

print [1,2,3,4,5].map {|x| x==2 }
print [1,2,3,4,5].my_map {|x| x==2 }
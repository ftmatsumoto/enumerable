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
  	
  end

end

[1,2,3,4,5].select { |x| puts "#{x}" }
[1,2,3,4,5].my_each_with_index { |x,y| puts "#{x},#{y}" }
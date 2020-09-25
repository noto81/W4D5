def my_min_1(list)
  min_ele = 0                                # O(1)
  list.each_with_index do |ele1, idx1|       # O(n)
    list.each_with_index do |ele2, idx2|     # O(n)
      if idx2 > idx1 && ele2 < min_ele       # O(1) 
        min_ele = ele2                       # O(1)       
      end
    end
  end
  min_ele                                    # O(1)

end                                          # O(n * n) => O(n^2)


def my_min_2(list)
  min = 0                                    # O(1)
  
  list.each do |ele|                         # O(n)   
    if ele < min                             # O(1)
      min = ele                              # O(1)
    end
  end
  min                                        # O(1)      
end                                          # O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1(list)  # =>  -5
# p my_min_2(list)  # =>  -5



# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. 
# Find the sums of all contiguous sub-arrays and return the max.

def sub_sum_1(list)
  subarr = []

  list.each_with_index do |ele1, idx1|
    list.each_with_index do |ele2, idx2|
      if idx2 >= idx1
        subarr << list[idx1..idx2]
      end
    end
  end
  subarr.map { |sub| sub.sum }.max

end # O(n^2)


  list = [5, 3, -7]

  # # possible sub-sums
  # [5]           # => 5
  # [5, 3]        # => 8 --> we want this one
  # [5, 3, -7]    # => 1
  # [3]           # => 3
  # [3, -7]       # => -4
  # [-7]          # => -7

  list2 = [2, 3, -6, 7, -6, 7]
  list3 = [-5, -1, -3]
  # p sub_sum_1(list) # => 8

  # p sub_sum_1(list2) # => 8 (from [7, -6, 7])

  # p sub_sum_1(list3) # => -1 (from [-1])

  def sub_sum_2(list)
    largest_sum = list.first
    current_sum = list.first
  
    # one loop only
    # need to get all subarr
    i = 1
    while i < list.length #loop to create subarr
      if current_sum < 0
         current_sum = 0
      end     
       current_sum += list[i]
      if current_sum > largest_sum
        largest_sum = current_sum
      end
      i += 1
    end
    largest_sum
  end

  p sub_sum_2(list)   # => 8 [5, 3, -7]
  p sub_sum_2(list2)  # => 8 list2 = [2, 3, -6, 7, -6, 7]
  p sub_sum_2(list3)  # => -1
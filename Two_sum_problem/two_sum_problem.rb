# Given an array of unique integers and a target sum, determine whether any two integers 
# in the array sum to that amount.

def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |ele1, idx1|
      arr.each_with_index do |ele2, idx2|
        return true if idx2 > idx1 && ele1 + ele2 == target_sum
      end
    end
    false
end # O(n^2)

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
  selected = arr.sort.select{ |n| n <= target_sum}
  
    selected.each do |ele|    # O(n)
      arr = selected.dup
      arr.delete(ele)
      return true if arr.include?(target_sum - ele) # O(1)
    end
    false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
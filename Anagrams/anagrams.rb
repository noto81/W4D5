require "byebug"
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. 
# Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.

def first_anagram?(str1, str2)
    # debugger
    chars = str1.split("") #O(1)

    anagrams = chars.permutation.to_a.map { |sub| sub.join("")} #O(n!)
    anagrams.include?(str2) # O(1)

end # O(n!)

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# Write a method #second_anagram? that iterates over the first string. 
# For each letter in the first string, find the index of that letter in the second string 
# (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an index is found 
# for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. 
# What are the differences between #first_anagram? and #second_anagram??



def second_anagram?(str1, str2)
    
    str1.each_char.with_index do |ele1, idx1|      # O(n)
        idx2 = str2.split("").find_index(ele1)     # O(n)
        if idx2 == nil
            return false
        end
        str2 = str2[0...idx2] + str2[idx2+1..-1]
    end
    str2.empty?
end  # O(n^2)

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true


# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. 
# The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram?

def third_anagram?(str1,str2)
   str1.split("").sort == str2.split("").sort # O(n log(n))
end
 
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true


# Write one more method #fourth_anagram?. 
# This time, use two Hashes to store the number of times each letter 
# appears in both words. Compare the resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.


def fourth_anagram?(str1,str2)
    hash1 = Hash.new(0) 
    hash2 = Hash.new(0) 

    str1.each_char do |char| #O(n)
        hash1[char] += 1
    end
    str2.each_char do |char| #O(n)
        hash2[char] += 1
    end

    hash1 == hash2

end # O(n)

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true


def fifth_anagram?(str1,str2)
    hash = Hash.new(0) 
   
    str1.each_char do |char|
        hash[char] += 1
    end
    str2.each_char do |char|
        hash[char] -= 1
    end

    hash.values.all?(0)

end # O(n)

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true


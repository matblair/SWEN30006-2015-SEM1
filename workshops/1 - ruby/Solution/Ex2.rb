"""
* SWEN30006 - Software Modelling and Design Tutorial Solutions
* Exercise 2 - Edward Crupi
* 02/03/2015
"""

#Determine parity
def exercise_one a
	if a.count { |x| x%2 == 0 } > a.size/2 then return :even else return :odd end
	# OR
	# (a.inject{|sum,x| sum += x%2 })%2 == 1 ? :even : :odd	
end

#Average of numerical values
def exercise_two a
	a.inject { |sum,x| sum+x }.to_f / a.size
	# OR
	# a.reduce(:+)/a.size.to_f
end

#Binary sum array
def exercise_three a
	a.inject { |sum, x| sum+x }.to_s 2
	# OR
	# a.reduce(:+).to_s(2)
end

#Sort array in to an array of arrays of types
def exercise_four a
	## A nicer less run throughs way
	result = {}
	a.each {|e| result[e.class] ||= []; result[e.class] = result[e.class] << e }
	result.values 
	
	classes = a.map { |x| x.class }.uniq.map { |type| a.select { |num| num.class == type } }
	#classes.each_with_index { |cla, i| a.each { |elem| if elem.class.to_s == cla.to_s then classes[i] ||= [] and classes[i] << elem  end } }
end

#Flatten array, taken from http://rosettacode.org/wiki/Flatten_a_list#Recursive_2 and adapted
def exercise_five a, results	# 'results' defaults to an empty list []
    a.each do |x|               #   for each element 'x' in lst
        if x.class == [].class	#      if that element is a list, then
            exercise_five(x, results)    #         flatten that sublist, appending results to "results"
        else                  	#      if element is not a list, then
            results << x 
        end	  					#         insert a copy of it at the end of "results"
    end
    return results       
end
a = [ 1, 2, [3, [4, 5] ] ]
b = []
p exercise_five a, b
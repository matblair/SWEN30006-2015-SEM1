
def class Creature

	attr_accessor :health

	def initialize 
		@xpos = 0 
		@ypos = 0
		@health = 100
	end

	def move_forward
		@xpos += 10
	end

	def move_right 
		@ypos += 10
	end

	def get_dist_from_centre
		Math.sqrt(@xpos**2 + @ypos**2)
	end
end

def odd_even_array array
	val = array.inject(0){|elem, val| val+= elem%2 }
	if val%2 > 0 
		return :odd
	else 
		return :even
	end
end

def average array
	array.reduce(:+)/array.size.to_f
end

def sum_binary array
	array.reduce(:+).to_s(2)
end

def flatten_array array
 	# later
end


d
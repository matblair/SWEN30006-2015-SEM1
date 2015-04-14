# Exercise 1
class Creature
  attr_writer :health

  def initialize
    @xPos = 0
    @yPos = 0
    @float = 100
  end

  def move_forward
    @xPos = @xPos+10
    nil
  end

  def move_right
    @yPos = @yPos + 10
    nil
  end

  def get_distance_from_centre
    (@xPos**2 + @yPos**2)**0.5
  end
end


# Exercise 2
def odd_even_array a
  a.count { |x| x%2 == 0 } > a.size/2 ? :even : :odd
end

def average a
  a.reduce(:+).to_f / a.size
end

def sum_binary a
  a.reduce(:+).to_s(2)
end

def flatten_array a
  result = []
  a.each do |x|
    if x.is_a? Array
      result.push(*flatten_array(x))
    else
      result << x
    end
  end
  result  
end


# Exercise 3
class Dice
  def initialize n, max
    @number_of_dice = n
    @die_sides = max
  end

  #Prints results of one roll of dice
  def roll_dice
    puts (1..@number_of_dice).to_a.map { |x| x=Random.rand(@die_sides) + 1 }
  end

  #Prints all possible results of rolling dice
  def all_possibilities
    puts (1..@die_sides).to_a.repeated_permutation(@number_of_dice).to_a
  end
end


# Exercise 4
def regex_sentence str
  !! str.match(/\A[A-Z][a-z]*([,;:-]? [a-z]+)*[.!?]\z/)
end

def regex_phone str
  !! str.match(/\A((\+61|0)[23478])?[0-9]{8}\z/)
end

def regex_email str
  !! str.match(/\A[\w\-]+@([\w\-]+\.)+[A-Za-z]+\z/)
end


# Exercise 5
def num_regex_matches str, regex
  str.scan(regex).size
end


# Exercise 6
def call_block
  if block_given?
    yield
  else 
    return :no_block_provided
  end
end


# Exercise 7
def count_lines
  line_count = File.open("../Input Files/exercise_7.txt", "r").read.split(/\n/).size
end


# Exercise 8
def unique_lines
  f1 = File.open('../Input Files/exercise_8_1.txt', 'r').read.split(/\n/).uniq
  f2 = File.open('../Input Files/exercise_8_2.txt', 'r').read.split(/\n/).uniq
  (f1 - f2) + (f2 - f1)
end


# Exercise 9
def longest_word text
  text.scan(/[A-Za-z]+/).max_by(&:length)
end

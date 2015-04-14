"""
* SWEN30006 - Software Modelling and Design Tutorial Solutions
* Exercise 3 - Edward Crupi
* 04/03/2015
"""
class Dice
	@numberOfDice
	@highestValue

	def initialize n, max
		@numberOfDice = n
		@highestValue = max
	end

	#Prints results of one roll of dice
	def roll_dice
		p (1..@numberOfDice).to_a.map { |x| x=Random.rand(@highestValue)}
	end

	#Prints all possible results of rolling dice
	def all_possibilities
		p (1..@highestValue).to_a.combination(@numberOfDice).to_a
	end
end

d = Dice.new 2, 6
d.all_possibilities
d.roll_dice

"""
* SWEN30006 - Software Modelling and Design Tutorial Solutions
* Exercise 1 - Edward Crupi
* 02/03/2015
"""
class Creature
	attr_reader :xPos
	attr_reader :yPos
	attr_writer :health
	def initialize
		@xPos = 0
		@yPos = 0
		@float = 100
	end

	def moveForward
		@xPos = @xPos+10
	end

	def getDistanceFromCentre
		return (@xPos**2+@yPos**2)**.5
	end

	def moveRight
		@yPos = @yPos + 10
	end
end
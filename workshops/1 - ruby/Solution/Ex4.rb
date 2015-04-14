"""
* SWEN30006 - Software Modelling and Design Tutorial Solutions
* Exercise 4 - Edward Crupi
* 04/03/2015
"""

#English Sentence
def exercise_one x
	p x.scan /\'?[[:upper:]][[[:lower:]]* [[[:punct:]]]]+/
end

#Australian phone numbers
def exercise_two x
	p x.scan /^(?:\+61|04|9|039|0011613)[[:digit:]]{7,9}/
end

#Emails
def exercise_three x
	p x.scan /^.+@.+$/
end

exercise_one '\'I\'m a well formed english sentence\', he said.'

exercise_two '0412312343'	 # Good
exercise_two '+61412312312'  # Good
exercise_two '+614123123123' # Too long
exercise_two '93123123'		 # Good

exercise_three 'ecrupi@student.unimelb.edu.au'
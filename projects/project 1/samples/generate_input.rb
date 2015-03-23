require 'Date'

input_1 = lambda {|val| 2*(val**5) - 3*(val**3) + 19.8*val - 12.92 }
input_2 = lambda {|val| Math.sin(val) + val - 120.2 }
input_3 = lambda {|val| 1.92*Math::E**(1.4*val) }
input_4 = lambda {|val| 6.4*val + 12.1 }
input_5 = lambda {|val| 12.86*Math.log(val) - 10.8 }
input_6 = lambda {|val| 8.2*Math.log(val) + 9.10 }
input_7 = lambda {|val| Math.cos(val) + val**2 - 110 }

inputs = [input_1, input_2, input_3, input_4, input_5, input_6, input_7]
filename = ["input_1", "input_2", "input_3", "input_4", "input_5", "input_6", "input_7"]
inputs.each_with_index do |func,index|
	file = File.open("#{filename[index]}.txt","a+")
	file.puts "time,datapoint,units"
	(1..100).each do |elem|
		file.puts "#{elem},#{(func.call elem.round(2))},mm"
	end
	file.close
end



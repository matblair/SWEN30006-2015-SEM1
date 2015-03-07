##SWEN30006 Project 1
###Getting To Grips With Ruby
####The Task
Your task is to develop a **Ruby** program that will take a file as input, in cvs format containing times and data values, and perform a variety of regressions on the data and come up with an equation of best fit. For example, given the sample data

    time = [1,2,3,4,5]
    data = [2,4,6,8,10]

One would come up with the expression

    data = 2 * time

Your job is to take the provided data files and apply four types of regressions: Linear, Polynomial, Exponential and Logarithmic (base *e*). You will then use your program to determine which type of equation best fits the data provided. This is an **individual** project and forms part of the basis for your final large project this semester.

###Input format

Input will be in the form of a CSV file with the following formats:

    time, datapoint, units
    1425083646, 102.2, mm
    1425083649, 98.2, mm
    1425083683, 82.3, mm

Where time is a unix timestamp, datapoint is a float value and units is the unit of measurement of each datapoint. Each of these values will be read in as strings. You will be required to read in the entirety of the CSV and store both the times and data points in an appropriate data structure to perform regressions (for example an array).

You are highly encouraged to make use of Ruby's built in CSV library to read and process the input files, but you can write your own file reader if you wish.

###Performing Regressions

It is up to you how you want to perform regressions. They are simple enough to peform yourself using simple matrix transformations, the following example performs a rudimentary polynomial regression of two arrays of data to the provided degree:

````ruby
  require 'matrix'

  def regress x_array, y_array, degree
    x_data = x_array.map { |x_i| (0..degree).map { |pow| (x_i**pow).to_f } }
    mx = Matrix[*x_data]
    my = Matrix.column_vector(y_array)
    @coefficients = ((mx.t * mx).inv * mx.t * my).transpose.to_a[0]
  end
````

You are also able to use any external libraries or *gems* that you think are useful to solve the problem. Efficient software re-use is key to being a good engineer, however you must give credit where credit is due and acknowledge any third party sources you incorprate into your project.

When regressing polynomials, it is up to you to determine the appropriate polynomial degree between 2 and 10. You should only return the polynomial of best fit within that range. All other regressions can be done for the one output degree provided in the output section.

> #####On Plagiarism
> We take plagiarism very seriously in this subject. You are not permitted to
> submit the work of others under your own name. This is an **individual**
> project. More information can be found [here](https://academichonesty.unimelb.edu.au/advice.html).

###Summary Of Results

You must include with your submission, a **pdf document** that outlines the results you have obtained from each data file along with how correct you consider these equations to be. Your correctness should be determined by the *fit* of the equation. That is, how closely does your regression matches the provided data.

For this exercise we are allowing you to chose your own method of determining the fit, whether that is as simple as an average variance or a more complex measure. We are more concerned with your analytical process and conclusions drawn. You are required to explain **why** you chose the given measure of fit.

This report should contain, for each data file provided, the equations you have found, the measure of fit of each equation and as a result, your determination of the best equation to describe this data set. An example would be

> ## File 3 : Results
> Through my regressions I found the following equations:
>
>  - Linear : 3x + 2, Average Variance: 1.3
>  - Polynomial : 2x^2 + x + 19.2, Average Variance : 0.008
>  - Exponential : e^(2x) + 10, Average Variance : 19.2
>  - Logarithmic : ln(10.2x) + 8.3, Average Variance : 18.2
>
> As a result, I conclude this data set is best modelled by a polynomial equation of 2x^2 + x + 19.2

You must also describe any difficulties that you faced in solving the problem and any issues you have had with Ruby itself.

###Submission Instructions

Project submission will be enabled through the LMS. We will require you upload a zip file of both your code and summary of results to the submission link we provide. This will then be run against automated tests for correctness.

The ruby file you provide should be able to be run through the command line and take 2 input arguments, the first should be the input filename and the second should by the type of regression to apply. The second argument can be one of the four following values; linear, exponential, logarithmic polynomial. The following indicates an example invocation of your program:

````bash
    ruby 613625-project-one.rb file_1.csv polynomial
````

Should read and process the appropriate file and output the results for only the regression type specified. Given we will be running automated tests, not taking note of these requirements will result in your program failing the automated tests.

This example of reading command line variables in Ruby may help. [Stack Overflow](http://stackoverflow.com/questions/4244611/pass-variables-to-Ruby-script-via-command-line)

###Output format

Your program should output the equation determined by your regression as a string in one of the following formats, you should not output the quotation marks.
For Linear Regressions: “ax + b”, where a and b are the values you have determined
For polynomial regressions: “ax^n … + c”, where a and c are values you have determined, you will need to print the output to the appropriate degree, so a fourth degree polynomial will be: “ax^4 + bx^3 + cx^2 + d + e”
For exponential regressions: “e^(ax) + b” where a and b are values you have determined
For logarithmic regressions: “ln(ax) + b” where a and b are values you have determined.

For explicit clarity here are a few examples of sample invocations and outputs.

````bash
    >> ruby 613625-project-one.rb example.csv linear
    >> 2x + 3.8

    >> ruby 613625-project-one.rb example.csv polynomial
    >> 3x^5 + 5x^4 + 2.5x^3 + x^2 + 10

    >> ruby 613625-project-one.rb example.csv exponential
    >> e^(3.1x) + 21.09

    >> ruby 613625-project-one.rb example.csv logarithmic
    >> ln(8.1x)+12.9
````

All program should be to stdout (the terminal window). Your regressions should be returned to at most, *two* decimal places.

###Marks

This project will account for 6 marks out of the total 100 available for this subject. These will be broken down as follows:

| Criterion  | Percentage |
| :------------: | :-----:|
| Correctness of Result | 2%|
| Code Quality (decomposition, variable naming, use of constants, ruby idioms) | 3% |
| Summary of Output | 1% |

The code quality will be judged on how well you have adapted to Ruby style. We expect to see good variable names, well commented functions, inline comments for complicated code. We also expect good object oriented design principles and functional decomposition. Output correctness will be automatically verified against expected results, therefore it is important your program outputs the correct format.

If your project fails the automated tests, you will get, at most, 1/2 marks for correctness.

##Submission Date

This project is due at **11:59 p.m. on the 29th of March.** Any late submissions will incur a 1 mark penalty per day unless you have supporting documents. If you have any issues with submission, please email Mat at mathew.blair@unimelb.edu.au, before the submission date.

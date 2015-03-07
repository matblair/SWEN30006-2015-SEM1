#Workshop 1: An Introduction to Ruby
## Week 1
This workshop will focus on introducing you to the Ruby programming language, providing a base for you to then expand on yourself through self guided learning as the need arises. 

This workshop has been written with a basic expectation that you are familiar with Object Oriented programming principles and that you have a good working knowledge of Java, as both are prerequisites for enrolment in this subject. 

This workshop will also assume that you have followed our instructions to get ruby installed on your machine already. If you have not, pay close attention to the code examples we give during the tutorial time and we will help with your installation in the second half of the workshop. 

>If you find any of the content in this worksheet difficult, don’t hesitate to
raise your hand and let us know.

###From Java to Ruby : Similarities

Ruby and Java are both object orientated languages, and as such, both follow the same ideas of data and functionality encapsulation and for the most part the same design patterns. There are differences in exactly how you create ruby classes and methods of extending them but we will discuss these later. 

As in Java, all objects in Ruby are strongly typed and memory is managed for you. You do not have to be concerned with allocation of memory, or manipulating pointers to objects as you would in C. Ruby still has Public, Protected and Private methods and variables within classes, however they are not as strongly enforced as in Java, there are still ways to call Private methods from outside the class in question. In general this wont be an issue for you but it is still worth noting. 

###From Java to Ruby : Differences

Whilst there are quite a few similarities, the differences are what will most likely cause issues of confusion as you are beginning to get to grips with Ruby. The biggest difference is that Ruby is a runtime interpreted language. This means that you don’t compile your code, in fact you don’t even have to create a file, you can simple open your console, type `irb` and start entering ruby commands that the interpreter will evaluate for you. Those that have experience with a language like Python or Haskell will be familiar with this notion.

As a result of this runtime interpretation you don’t have to cast objects in order to call methods that on them. For example if you pass in a generic object, but you know that the object is a “Person” class that you have created with a method “run()”; in Java you would typecast it as such:

```ruby
public makePersonRun(Object obj) {
  Person p = (Person) obj;
  p.run();
}
```

Obviously this is unsafe practice and in reality we would want to check if ‘obj’ is the correct class before we typecast and call run, otherwise throwing an exception. In ruby we don't have to deal with this, as long as the method is there on the object when it is called, it will run, so in ruby we would do this like follows:

``` ruby
person = Person.new

def makePersonRun obj
	  obj.run
end

makePersonRun person
```

If the method doesn’t exist on the object that we are calling it on, ruby will `throw` an exception which you will have to deal with, but the core principle is very important. As long as the functionality is there when you try to run it, it will succeed, this is key to many of the more advanced features of Ruby as we will discover later. 

As you may have noticed in the code blocks given above, there are also differences in syntax for calling methods and for defining methods and classes. Instead of braces surrounding our classes or methods we begin with either “class” or “def” and we show the ending with “end”. 

Methods are called either with or  without braces, and parameters can be passed in like shown in “makePersonRun person” or with braces, like “makePersonRun(person)”. In Ruby we also don’t need to define types for variables when we assign them: they are just labels for given objects. 

>Ruby does not perform any type checking, so it is up to you to make sure you don’t make any mistakes, this is usually checked in unit testing, though we wont go into too much detail about that. 

In Ruby, everything is an object, there are no primitive types which allows for interesting functionality in extending the base classes, like String or Numeric. Ruby’s use of `==` and `equals()` also differs from java (they are the opposite). Finally all variables of a member are private in Ruby and are accessed through methods. Thankfully Ruby provides some helpful syntactic sugar in order to accomplish this, as shown below.

```ruby
require 'date'

class ExampleClass 	
  attr_reader :read_variable
  attr_accessor :read_write_variable
  
  def init
    @read_variable = 0
    @read_write_variable = 0
  end
	
  def setLastCreated
		@@last_init ||= DateTime.now
  end
end
```

In this example we have quite a few interesting things happening that you should take note of. We have two instance variables in `ExampleClass`, `read_variable` and `read_write_variable`. The `@` character that prefixes them is Ruby’s way of defining an instance variable for a given class. If we wanted to created a class variable, we would use `@@` as in the `last_init` variable. This example also shows the equivalent of an `include` (Objective-C) or `import` (Java) statement, by requiring the `date` library for this given file. As a result, anywhere throughout the file you will be able to use the classes provided by the date library. 

Furthermore we see the `attr_reader` and `attr_accessor` helper methods at work, these methods work to generate the equivalent of getter and setter methods for your ruby class. This means that you will be able to make statements like 

    instance_of_example_class.read_write_variable = 10 

The attr_accessor method will have created the required accessor method to write to this variable and call it for you. You can choose to do this yourself if you really like, however it is unnecessary unless you wish to provide conditional access (think security applications). 

The final thing we will mention before we hit you with questions is the use of the `||=` syntax. This is Ruby's way of creating and assigning an instance or class variable if it didn’t already exist. Without this Ruby will attempt to assign a value to a `nil` object and you will have runtime errors.

###Using Ruby 

Ruby is a remarkably straightforward language to begin using. In order to help you on your way, we will provide some examples of how to do simple things like create arrays, add variables to arrays and common methods for dealing with strings below. First, beginning with arrays;

```ruby
# -- Defining Arrays -----------------------
array = Array.new
array1 = [:peanut, :butter, :and, :jelly]
array2 = ["Hello", 2, :butter]

# -- Manipulating Arrays -------------------
array.push(:jumping) # Adds :jumping to end of array
sliced_array = array[0,2] #Retrieves a range of elements from 0-2 
              #(i.e. elements 0 and 1).
array2.unshift("First") # Adds element to the start of the array2
array2.shift() #Removes the first element, in this case “First"
```

As you can see, working with arrays in Ruby is quite straightforward. We recommend looking at the ruby docs to see the full range of methods available on arrays, but the above code should be enough to get you started. Next having a look at some common methods on strings on the next page. 

```ruby
# -- Defining Strings -----------------------
string_with_double_quotes = "Hello, World"
string_with_single_quotes = '"Hello, World" - He Said'
# Notice how single quotes allow us to include the double
# quotes without needing to escape them. Useful for spoken statements
multi_line_strings = %{
Hello,
This is a super long string.
It's really easy to do in ruby. 
}

# -- Operating on Strings --------------------
concatenated = "Hello" + " I'm" + " concatenated"
badly_formatted "I:am:badly:formatted"
fixed_formatted = badly_formatted.split(/:/)
join_me = ["I", "got", "split", "up", ":("]
reunited = join_me.join(" ")
```

Now that we have given you a rough overview of Ruby syntax and some examples of usage, it should be very apparent that you can easily create quite powerful programs with ruby with very little work. There are is an exercise to do before we move into discussion of some of Ruby’s more unique features. 

####Exercise 1 - Core
Now that you  have a basic understanding of Ruby syntax and class structure. Your first exercise is to take the following Java class and create the ruby equivalent. 

>You should have all the knowledge you need to make the translation, but feel free to ask any questions if you get stuck. As a hint, the functions available on the ruby math class are available in the ruby docs online. 

```java
@import Java.util.Math
public class Creature {
	
	private int xPos;
	private int yPos;
	public float health;

	public Creature() {
		xPos = 0;
		yPos = 0;
		health = 100;
	}

	public void moveForward() {
		xPos = xPos + 10;
	}

	public float getDistanceFromCentre(){
		return Math.sqrt(Math.pow(xPos,2) 
				+ Math.pow(yPos,2));
	}

	public void moveRight() {
		yPos = yPos + 10;
	}

}
```

### Unique Ruby Features

Ruby has some unique features that you may not have encountered before, depending on your software language background. It has a way of expressing closures that you cannot do in java (as seen in blocks, prods and lambdas). Ruby also has much more flexibility in terms of extending classes and changing software behaviour at runtime than other languages to do.

Once you have written a class, it’s quite straightforward to add methods to it without changing the original class at all. Below we will give some overview of how these features work, however you will be best doing additional reading through the ruby docs in order to ensure you understand them.

#### Symbols
Symbols are how Ruby handles constants. Rather than defining an INT Constant to define things like compass directions or identifiers, symbols provide the ability to have a unique constant without worrying about the value assigned to it, they are also immutable, that is they cannot be changed in value. They are, in essence, lightweight strings and as such can also be used for method calls (assuming the symbol is named the same as the method). They are used as such:

```ruby
def name_direction(direction)
  if direction == :east 
    puts "Going East"
  elsif direction == :west
    puts "Going West"
  end
end
```

Notice how we haven’t defined anywhere the values of `:east` and `:west`. We don`t need to because Ruby garauntees uniqueness of a symbol name and value within a program. 

#### Blocks, Procs and Lambdas
A block is a chunk of code enclosed between either braces or the `do` and `end` keywords. In general, braces are preferable for inline blocks and the `do` and `end` keywords are preferable for multiple line blocks. You can think of blocks as anonymous methods that can be passed to methods as if they were parameters to the method. 

You can use blocks to allow for callbacks, to pass around useful pieces of code (much like function pointers in c) or implement iterators. Blocks (and by extension Procs and Lambdas) are closures, that is, they remember the context in which it was defined and will run in that context whenever it is called.

In simpler terms, this means that any constants, class variables, local variables, blocks within a block and the value of all self will depend on where the block is initially created. This should be more clear with the example below;

```ruby
class someclass 
  @@ClassVariable = 2
  def return_lambda
    local_variable = 1 
    @instance_var = 2
    lambda {|&blk| [@@ClassVariable, localvariable, @instance_var, blk.call]}
  end
end
```

Here we have a class with a method return_lambda that returns a lambda object that returns three variables and yields the last one. This means whenever it is called (from wherever it is called) it will return the current value of `@@ClassVariable`, local variable and `@instance_var` as well as the parameter given to the block. This will sound a little confusing at first, but we will go over this further in class. 

Procs are an object form of blocks. A block itself is not an object, but can easily be converted into one by using one of four forms: defining a new proc object with a block, adding an ampersand to the variable of the method call receiving a block, calling lambda with a block and using `->` on a block. Examples of these are included in the workshop zip file as they are easier to understand in context. 

For simplicities sake, we will not delve too heavily into the details of yields, calls and returning on blocks yet as you will not need them immediately, however feel free to read up online and we will go over them further at a later date. 


### Control Statements

Ruby provides a plethora of options in writing control statements. In particular we are going to discuss case statements and breaks. In Ruby, a case statement is defined as shown in the following example:

```ruby
score = 85

case score
  when 0..50 
    puts "Your score is a F"
  when 50..64
    puts "Your score is a P"
  when 65..69
    puts "Your score is an H3"
  when 70..79
    puts "Your score is an H2"
  when 80..100
    puts "Your score is an h1"
  else 
    puts "Not a valid score"
end
```

As you can see, the syntax for Ruby’s case statement is very similar to that of Java. The statement states by identifying the variable that we will switch on, in this case it is score. A case will then match provided the expression given (in this case a series of ranges), return true when compared to the variable being switched on, that is, `variable==expression` returns true. As a learning exercise, in your own time experiment with the precedence of case statements, what happens if a variable matches multiple cases?

The control statements for if statements are trivial.
```ruby
if somecondiiton
   puts "first statement"
elsif some_other_condition
   puts "second statement"
else 
   puts "something else"
end
```

####Mixins and Inheritance

Ruby is an incredibly flexible language, and nothing demonstrates this better than how easy it is to add new functionality to existing classes, even without seeing their source code. Due to Ruby’s runtime nature, adding or overriding method calls on classes is easy once you understand how methods are called. Say for examples sake that you have a class called Ball, and it has a method “bounce”. 

Say we then create a subclass called squash_ball that inherits from Ball. Initially if we call the method “bounce” on squash_ball, the ruby interpreter will look for that method on squash_ball and if it can’t find it, it will go up to the superclass and look for the method there. Overriding a method, then, is as easy as defining that method on a squash_ball, that way the interpreter wont have to look any further and will run the first method it finds. This sounds simple now but the power comes when you realise how easy it is to add functionality to base classes, such as Fixnum.

Imagine you are working with a series of numbers and you wanted an easy method to change them into base 6. Ruby has no default conversion to base 6 on the fix num class, but adding one would be as simple as writing: 

```ruby
class Fixnum
  def convert_to_base_six(convert)
    # Write your function to convert here
  end
end
```

Now, any classes or methods within that same Ruby file will be able to call the method `convert_to_base_six` on any Fixnum object, no subclassing necessary! Another useful Ruby feature that greatly simplify code creation are Modules and Mixins. 

Mixins provide Ruby users with multiple inheritance without the mess of having to worry about who owns the variables etc. We again wont’d delve to heavily into them here, because we want you to get started programming in Ruby (and because there is enough to go on for a whole workshop on using mixing and modules to create good design) but it is important you are aware of their existence and if you feel like extending yourself we encourage you to go read up on them before the next workshop, as we will be discussing them more when we introduce the Rails framework. Now lets finish with a small summary exercise.

#### Exercise 2 - Core
Write a function to solve each of the following small problems:

- A function that takes an array and returns `:even` if the array contains more even numbers than odd and returns `:odd` otherwise.
- A function that takes an array and returns the average of all values in that array. Non numerical values should be ignored. 
- A function that takes an array and returns the sum in binary
- A function that takes a number of different types of objects and returns an array of arrays with those objects separated. For example the input:
  ````ruby
  ["Hello",1,12.3,"Name",{"hello"=>1},:hello]
  ````
Should return the following
  ````ruby
  [["Hello","Name"],[1,12.3],[{"hello"=>1}],[:hello]]
  ````
- A function that takes an array of arrays and flattens them into one (you cannot use the 'flatten' method for this)

## Week 2
#### Exercise 3 - Core
Before we present any new ruby ideas, we have a simple exercise to run through. For this exercise you are required to create a dice rolling class that is initialised with an argument for the number of dice and an argument for the number of sides. This class must provide the following two functions:

- `all_possibilities` - Prints the combinations of all possible dice rolls with the chosen dice and number of sides.
- `roll_dice` - Rolls all ’n’ dice and prints the result of the roll. This should be random as expected from a real dice roll.

You will have five minutes to complete this exercise, we will be coming around to check your solutions and then rejoin for a quick discussion before continuing.

### Regular Expressions: Pattern Matching
Regular Expressions are a tool used for expressing a regular language in string form. Their principle use is in pattern matching, however there is a limit to the kinds of patterns they can match. They can only describe languages that are regular and context-free. 

There is a theoretical underpinning on which these are based and if you are interested feel free to research finite state machines and the relationship between context-free and context dependent grammars in your own time, for this workshop we will focus on practical application.

Regular expressions follow a set syntax that is dependent on the language they are implemented in. Traditionally only 3 operations are allowed, `+`, `|` and `*`. In Ruby, an extended regular expression syntax is used, the options available are shown [here](http://ruby-doc.org//core-2.1.1/Regexp.html). For example, to match a proper noun we could use the expression:

```ruby
  \A[A-Z][a-z]+\z
```

Now that we have shown you the basic syntax used to define a regular expression, work together with the person next to you to define regular expressions for the following exercises. 

#### Exercise 4 - Core
Define a regular expression to match the following types of strings:

- A well formed sentence
- An Australian phone number (mobile or land-line)
- An Email Address

### Regular Expressions in Ruby

Thankfully, Ruby makes working with regular expressions incredibly simple thanks to the built in Regex class. In Ruby, to define a regular expression we use the following syntax:

```ruby
  expr = /expression_goes_here/
```

To then check if this expression matches, all we need to do is call match with the string we want to test, like so:
```ruby
  expr.match("Some example string")
```

This returns a MatchData object which will contain any strings matched as well as information about the number of matches and numerous methods to access this data. We suggest taking a thorough review of the MatchData class in the RubyDoc for more a better understanding. 

You can also use two other methods to check for matches, one of which is on a string, and the other is a variant of the example above, like so: 

```ruby
  "Some example string"[/expression_goes_here/]
  /expression_goes_here/.match("Some example string")
```

This returns a MatchData object which will contain any strings matched as well as information about the number of matches and numerous methods to access this data. We suggest taking a thorough review of the MatchData class in the RubyDoc for a better understanding.

Ruby’s Regex engine also allows back referencing and variable referencing for matching. The back referencing is more advanced and wont be necessary for this workshop however feel free to look it up in your own time. Variable referencing allows us to match expressions to variables to look up later and will make the exercises below considerably easier and works as follows. Say we want to identify the contents of a paragraph tag in html, we could use the following expression:
```ruby
   /<p>(.+)<\/p>/.match("<p>Hello People</p>")
    => #<MatchData "<p>Hello People</p>"" 1:"Hello People"> 
```

As we can see from the returned MatchData object, the string `"<p>Hello People</p>"` was matched and the variable `$1` is now `"Hello People"`. This is a very basic example, and there are numerous more complex methods available on MatchData objects that allow for more complex information extraction, however we will leave you to learn about these on your own if you desire as they will not be necessary for your projects. 

#### Exercise 5 - Core
Write a ruby function to return the number of matches for a given string and Regex object. 

### Using Blocks and Procs
Blocks and Procs are Ruby's way of handling functional closures. They allow you to pass around functions as an argument and write more generic, reusable, code. There are two ways you can pass in a block to method, the syntax for the first is as follows: 

```ruby
def with_blocks
    yield(block_args) #yield control to blocks with given arguments
    yield(diff_args) #yield control to blocks with different args
end
```

This method requires no explicit input argument for the block, however the method yield will fail if a block has not been passed in. It will only work with one argument, as an experiment in your own time feel free to experiment what happens when you try and call yield with more than one block being input. 

You can however call that block many times with differing (or the same) arguments and the code you passed as the block will be run many times with the arguments provided. This is the most common way to handle blocks in Ruby, as we often don’t require more than one block being passed in at the same time. The only concern here is we have to assure that we do have a block before calling yield, as yield will fail quite spectacularly without a block to run, we can do this as shown in the example on the next page. 

```ruby
def with_blocks
    if block_given?
      yield(block_args) #yield control to blocks with given arguments
    else 
      return :error_symbol
  end
end
```

This way we check for a block before calling yield returning a value indicating the error if we do not. This would also be a prime area where you could raise an exception if you chose, however we will not be providing any examples on how to do this as it is well documented online. The second method to call a block requires an explicit call to the block, with Proc objects passed in as arguments as shown below seen below: 

```ruby
  def with_blocks_explicit(block1, block2)
    block1.call(args)
    block2.call(args)
  end
```

This allows us to pass in any number of Procs and call them in whatever order we like without being restricted by the limitations of yield. At this point we shall define a Proc. A Proc is simply the object form of a block and for the most part have the same function, the only difference is how they are defined. A block itself doesn’t have a variable name and must be repeated if you wanted to pass it into different functions. A proc however can be defined as follows: 

```ruby
   a = Proc.new{|input| puts 20*input}
```

If we were to define a second proc which added 10 to the input, we could then call the function with explicit blocks as shown below:

```ruby
  with_blocks_explicit(a,b)
```

This will then call both blocks with the arguments stated in the with_blocks_explicit function. As you can imagine this opens up a large number of design possibilities and we will be covering these in more depth when we explore Rails.

#### Exercise 6 - Core
Write a function that takes a block as an argument and either evaluates the block and returns the value from that block, or returns the symbol `:no_block_provided` if there is no block provided. 


### Sandwich Code 

In a lot of situations dealing with iteration we often find ourselves in a situation in which we end up rewriting the same code multiple times in order to apply different functions in the middle of our control statements. In most programming languages this can’t be avoided, especially in those without function pointers. 

Sandwich Code refers to this phenomenon, namely that there are many situations in which you have an opening sequence, then do something, then have a closing sequence.

In this metaphor our opening and closing statements are our Sandwich bread and the meat is the work we are doing in the middle. This kind of design pattern occurs frequently when doing things like reading files or enumerating over data. In fact, we have already been using this idea with our array iteration. When we call `each` on an array and pass in a block of code we are in fact giving Ruby the 'meat' to our operation and it handles the opening and closing sequences, namely counting the number of items in the array, setting up the for loop, iterating through and calling the 'meat' function with the right arguments, then returning the appropriate value. The `each` construct allows us to forget about doing all of the menial work and focus on what we want to do to the data. 

We can write Sandwich functions like this for a large majority of repetitive work we do in Ruby, and it requires a solid understanding of block passing. Once we understand how to pass a block and call it later, we can abstract away the repetitive work (for example, opening a file or reading an image in) and simply pass in the method to manipulate data whenever we need to do so. For example if we define the function manipulate_file function as follows:

```ruby
  def manipulate_file(file_name)
    file = open(file_name)
    yield(file)
         ensure
    file.close if file
  end
```

We then have a function that can take a file name and a block, then ensure that the file is opened and closed correctly and allow us to focus on the method of what we will do with the file. A lot of the internal Ruby functions are structured in this way (as you will see below in File I/O) so familiarity with this idea is key to developing a good code structure in Ruby.

### File I/O

The Ruby file I/O class is very straightforward to use. To `open` a file, it is a simple as defining a variable file to be the result of the open function, as shown here:
    
      file = open(file_name, arg)

If the file exists then Ruby will open it and you can manipulate the file object with any of the methods available on it, as listed here: RubyDoc File Class or on its parent class IO here RubyDoc IO Class. Both of these classes are part of the Ruby core library so you do not need to import them.  If the file does not exist then Ruby will create it for you (provided you  have permissions to write in the directory you specify) and provide a file object you can then manipulate. The args specify allow you to open files in different modes, as shown below in the table from the RubyDoc. 

| Mode | Explanation |
| :------------: | :-----:|
| "r" | Read-only, starts at the beginning of a file (default mode).|
| "r+" | Read-write, starts at the beginning of the file.|
| "w" | Write-only, truncates existing file to zero lnegth or creates a new file for writing.|
| "w+" | Read-write, truncates existing file to zero length or creates a new file for reading and writing.|
| "a" | Write-only, starts at the end of the file if it exists otherwise creates a new file for writing.|
| "a+" | Read-write, starts at the end of the file if it exists otherwise creates a new file for writing.|

If you open a file described using the method above, you must be sure to close it, as shown in the example from the Sandwich code section. Obviously with a large number of file operations this kind of finger exercise becomes tiresome (hence the Sandwich code) and thankfully Ruby agrees and provides built in methods that take care of opening and closing files for you, with blocks for the file manipulation. For example say if I wanted to read a file in and print the length of each line, I could do it like so: 

```ruby
File.open("sample_file.txt", "r") do |file|
  while line = file.gets
    puts line.length()
  end
end
```

In this case Ruby has handled the “bread” part of our sandwich code for us, ensuring the file is properly opened before performing our block, and closed after. If we wanted to add to a file that would be just as easy, as shown in our last example on the next page. 

```ruby
File.open("sample_file.txt", "a+") do |file|
  lines=0
  more_than_80 = false
  
  while line = file.gets
    lines += 1
    if line.length() > 80 
      more_than_80 = true
    end
  end

  file.puts("-------------------------------------")
  file.puts("This file contains #{lines} lines")
  if more_than_80
    file.puts("You have lines that are more than 80 characters")
  end
end
```

In this example we iterate through a file to count the number of lines and check if any lines are longer than 80 characters, then let the use know what we found. Using these ideas as a springboard, move on to the exercises below to create a program that will apply everything learnt in this workshop. 


#### Exercise 7 - Core

Implement a program that reads in the provided file ('exercise_7.txt') and counts the number of lines that appear in the file. You should use the idea of Sandwich Code in order to make your code more extensible.  

#### Exercise 8 - Core
Write a program that reads both of the provided files ('exercise_8_1.txt' and 'exercise_8_2.txt') and returns an array of the lines that are unique (that is, only in one file or the other, not in both). You may only use two arrays for this task.

#### Exercise 9 - Core

Now that you have code that can open a file and operate on individual lines, you should extend your code to write a program that will find the longest word within a paragraph. This will require you first accurately identifying what a paragraph is, then identifying the longest word within that string. Consider using the Regex variables for an easy way to isolate the multiline paragraphs. 

#### Exercise 10 - Extension

Now build on your code further by providing a file overview for the provided HTML file ('exercise_10.html'). You should print the file title, its Author (if present), the number of lines, number of paragraphs, number of words in the paragraphs, whether or not the file has any images and how many other HTML files it links to.

#### Exercise 11 - Extension

Finally, we will provide a plain text overview of the HTML file, taking in the file and creating a new one that has sections for page information, paragraph contents, images and links. This file should be saved as a plain text file called “$FILE_NAME - Summary.txt” where $FILE_NAME is replaced with the name of the HTML file you’re parsing.

#### Exercise 12 - Extension
As an extension, do some research on the Nokogiri gem. Nokogiri provides a built in HTML parser that allow you the ability to query for paragraphs or query for certain keys. It includes the ability to parse HTML, CSS and XML from either a file or from the web and should make this task quite a bit simpler than your previous program. See if you can re-implement the exercises using Nokogiri, what parts are easier? Are there any parts that are more difficult?

## Workshop Submission
You are required to submit your answers to all of the exercises marked 'core' in this weeks workshop. You should submit one file, named 'workshop 1 - STUDENTNO.rb' where STUDENTNO is replaced by your student number. For example, if your student number was 12345, your file should be called `workshop 1 - 12345.rb`.

You should name each function by number so that we may automate our tesitng, i.e. 
```ruby 
  def exercise_one
    # Answer to exercise one goes here
  end
```

The submission for this workshop is due at **11:59 pm, Sunday the 22nd of March**.



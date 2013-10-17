def welcome (name = "World")
	puts "Hello " + name
	puts "Hello #{name}"
	return "test"
end

def return_two_arguments (num1 = 10, num2 = 10)
	add = num1 + num2
	sub = num1 - num2
	return [add,sub]  # return an array of the two results
end

def write_lines_on_chalkboard (line = "I will never ditch another Ruby class again.", num_lines = 100)
	return "<on_chalkboard>\n"+((line+"\n")*num_lines)+"</on_chalkboard>"  # the splat will recurrsivly create and append the number of lines specified.  * is an operator in the string class
end

welcome("Jay")

welcome

array = return_two_arguments( 6, 2 )
puts array[0]
puts array[1]

add, sub = return_two_arguments( 10, 4 )
puts add
puts sub

#puts write_lines_on_chalkboard

class ClassNameMustBeginfWithCapitolLetterDotUseCamelCase
	attr_reader:name_one  # the equivilent is 
	#def name 
		#@name 
	#end
	def set_name_one()   #  we have to write the set because attr_reader only lets you read the attribute
		@name_one = "ONEoneONE" #instance variable
	end

	attr_writer:name_two  # the equivilent is 
	#def name=(value)
		#@name  = value
	#end
	def name_two #  we have to write the return because attr_writer only lets you set the attribute
		"the name two is #{@name_two}."
	end
	

	attr_accessor:name_both #does both the reader writer functionality for the attribute

	def set_my_variable(argument)  #common set proceedure
		@my_variable = argument #instance variable
	end
	
	def my_variable=argument  #syntactic sugar set proceedure. unique to ruby.  can be written as my_variable=(argument) also.
		@my_variable = argument + " - method used was my_variable= as the name of the def" #instance variable
	end
	
	def first_method
		puts "I have class!"
		puts @my_variable
	end
end

my_class = ClassNameMustBeginfWithCapitolLetterDotUseCamelCase.new
my_class.set_my_variable("Yummy instance variables.")
my_class.first_method

my_class2 = ClassNameMustBeginfWithCapitolLetterDotUseCamelCase.new
my_class2.my_variable = "Yummy second instance variable."
my_class2.first_method

my_class3 = ClassNameMustBeginfWithCapitolLetterDotUseCamelCase.new
puts my_class3.name_one
my_class3.name_two = "name2"
puts my_class3.name_two
my_class3.name_both = "both"
puts my_class3.name_both
my_class3.first_method
my_class3.set_name_one
puts my_class3.name_one + " - 1"


#this is a new comment
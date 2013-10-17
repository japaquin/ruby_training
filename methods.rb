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
	
	def set_my_variable(argument)
		@my_variable = argument #instance variable
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
my_class2.set_my_variable("Yummy second instance variable.")
my_class2.first_method
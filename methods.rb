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

class MyClass # Class Names Must Begin With a Capitol Letter. Use Camel Case
	
	# these are class varibales and unlike block vaiables (attr_reader:name_one for instance), 
	# you'll have to create reader and writer functions to read and set them
	@@enum = ['option_one','option_two','option_three','option_four'] #enum class variable
	@@this_classes_instances_created = []
	
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
		"name two is #{@name_two}."
	end
	

	attr_accessor:name_both #does both the reader writer functionality for the attribute
	
	
	def initialize(start_up_value, arbitrary_value = "something")
		@name_two = "name_two_default_value" #instance variable
		puts start_up_value + " - " + arbitrary_value
		@@this_classes_instances_created << self
	end
	
	# this_classes_instances_created reader and writer methods
	def self.this_classes_instances_created  #  reader method for this_classes_instances_created
		@@this_classes_instances_created
	end
	def self.this_classes_instances_created=(array=[])  #  writer method for this_classes_instances_created
		@@this_classes_instances_created = array
	end
	# this_classes_instances_created reader and writer methods
	
	
	def self.create_me(start_up_value)  # be good for creating a singleton?
		myself = self.new(start_up_value)
		return myself
	end
	
	def self.my_enumeration
		@@enum  #returns the enum class variable
	end
	

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

my_class = MyClass.new("my_class_instance")
my_class.set_my_variable("Yummy instance variables.")
my_class.first_method

my_class2 = MyClass.new("my_class2_instance")
my_class2.my_variable = "Yummy second instance variable."
my_class2.first_method

my_class3 = MyClass.new("my_class3_instance")
puts my_class3.name_one
puts my_class3.name_two
my_class3.name_two = "name2"
puts my_class3.name_two
my_class3.name_both = "both"
puts my_class3.name_both
my_class3.first_method
my_class3.set_name_one
puts my_class3.name_one + " - 1"

puts MyClass.my_enumeration.inspect
puts MyClass.this_classes_instances_created.inspect
MyClass.this_classes_instances_created = ["test","testing"]
puts MyClass.this_classes_instances_created.inspect

my_class4 = MyClass.create_me("my_class4_instance")
puts my_class3.name_two




class Animal
  attr_accessor :name
  attr_writer :color
  attr_reader :legs, :arms

  @@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']
  @@current_animals = []
  
  def self.species
    @@species
  end
  
  def self.species=(array=[])
    @@species = array
  end
  
  def self.current_animals
    @@current_animals
  end
  
  def self.create_with_attributes(noise, color)
    animal = self.new(noise)
    animal.color = color
    return animal
  end
  
  def initialize(noise, legs=4, arms=0)
    @noise = noise
    @legs = legs
    @arms = arms
    @@current_animals << self
    puts "A new animal has been instantiated."
  end
  
  def noise=(noise)
    @noise = noise
  end
  
  def noise
    @noise
  end
  
  def color
    "The color is #{@color}."
  end
end


class Cow < Animal  # Cow Inherits Animal.  Only one level of inheritance is supported in ruby
	
	#Overriding.  Just name this local def the same as the def you want to override
	def color
		"The cow's color is #{@color}"
	end
	# In fact, this method will override our override above because its the last def.  Ruby won't complain, something to watch out for.
	def color
		"The booming cow's color is #{@color}"
	end
	
end


class Pig < Animal
	def noise
		#"Hello"
		#  super #this is a method that calls the super class's method for the noise method
		#   now going to caapture the return and return it from here
		parent_noise = super
		return "Hello and also #{parent_noise}"
	end
end

wilbur = Pig.new("Oink!")
puts wilbur.noise

maisie = Cow.create_with_attributes("Moo!","Yellow")
puts maisie.noise
puts maisie.class
puts maisie.color

x = [1,2,3]
puts x.to_s

#now override the ruby library behaviour and re-write the to_s behaviour
class Array
	def to_s
		self.join(' - ')
	end
end
# see how it works now, after the override
puts x.to_s


#this is a new comment
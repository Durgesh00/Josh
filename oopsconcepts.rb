class Employee
	@@vikram=2   #class Variable is associated with a class and all the objects of that class use the same copy 
                 #of that variable

  attr_reader :name  #A Ruby object has its methods public by default, but its data is private. 
	attr_writer :name  #So if you need to access the data, for either reading or writing, we need to make it public
	attr_accessor :salary #attr_reader, attr_writer, and attr_accessor are used for this purpose.
                 

	def initialize(name,salary)  #constructor
    puts 'object initialize'
    @name=name
    @salary=salary
  end

#public Access specifier
public
  def company_policies
    p 'this is a public method'
    emp_salary
  end

#protected Access specifier
protected
  def department
    p 'this is a protected method'
  end

#Private Access specifier
private 
  def emp_salary
    p 'This is a private method'
  end

  #a class method is a method that resides at the class level. 
  #On the opposite, an instance method is a method that resides at the object level. 
  #In ruby, classes are also objects, so the methods defined as class methods only exist in the object that defined them 
  #(the class) and nowhere else.  
  def self.cls_method
  	p 'Class method called'
  end

  def name    #Getter methods are used to get the value of an instance variable 
    @name
  end
   
  def set_name(name)   #setter methods are used to set the value of an instance variable of some class.
    @name=name
  end

end
emp=Employee.new('Durgesh','4099')
emp.company_policies
Employee.cls_method
puts emp.name
emp.name='Sanjay'
puts emp.name
puts "Employee Salary: #{emp.salary}" 
emp.salary="500000"
puts "Employee Salary: #{emp.salary}" 
emp.set_name('Ram')
puts emp.name
puts Employee.class_variables
puts Employee.instance_variables
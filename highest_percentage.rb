#Problem:Calculate the weekly Percentage of students for a 8 weeks Ruby Programming course

class Result 

	@@id=0
	@@highest=[]
	def initialize(name,marks)
		@@id+=1
    @stud_id=@@id
		@name=name
		@marks=marks
		@cnt=0
	end

	def calc_percentage()
		
		for i in 0..@marks.size-1  do
			@cnt+=@marks[i]
		end
		
		@total=(@cnt*100)/800.0
		@@highest.push(@total)
		print "Students ID:" , @stud_id
		puts ' '
        print "Students name:" , @name
		print "Students Percentage:" , @total
		puts ' '
	end
	

	def self.highest_percentage
		puts @@highest.max 
	end
end

print "Enter number of students"
no_of_stud= gets.to_i

for i in 0..no_of_stud-1 do
	print "Enter the name of students"
	name=gets
	marks=[]

	puts "Enter the marks of the students"
	for j in 0..7 do
		marks[j]=gets.to_i
	end
  student1=Result.new(name,marks)
  student1.calc_percentage
  puts ' '
end

puts "Highest marks among all the students"
Result.highest_percentage
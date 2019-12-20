#Implement a food ordering portal with following functionalities:
#1. Accept Order
#2. Display Order status
#3. Check Food Item is available for ordering
#4. Change status of order

class Food_Ordering_System
	@@menu={"Pizzas"=>200,"Dal"=>100,"Egg Roll"=>50,"Veg Roll"=>30,"Momos"=>20,"Butter Chicker"=>300}
	@@menu_count={"Pizzas"=>5,"Dal"=>5,"Egg Roll"=>5,"Veg Roll"=>5,"Momos"=>5,"Butter Chicken"=>5}
	attr_accessor :status

	def initialize
	  @ordered_item={}
		@status=false
	end

	def display_menu
		@@menu.each do |key,value|
			print "Dish: #{key}   Price:#{value}"
			puts ''
		end
	end

	def check_item
		print "Enter The Name Of Item You Want To Check :"
		item=gets.chomp

		flag_check=false
		@@menu.each do |key,value|
			if key==item
				flag_check=true
			end
		end
		if flag_check
			if @@menu_count[item]>0
				print "Yes The Item Is Available!"
				puts ''
			else
				print "Sorry, The Item Is Not Available!"
				puts ''
			end
		else
			puts "Invalid Input"
		end
	end

	def check_status
		if @status
			print "Your Order Has Been Placed!"
			puts ''
		else 
			print "Your Order Is Pending!"
			puts ''
		end
	
	end

	def accept_order
		flag=true
		while(flag)
			print "Enter The Item You Want To Order: "
			puts ''
			item=gets.chomp
			flag_in=false

			flag_check=false
			@@menu.each do |key,value|
				if key==item
					flag_check=true
				end
			end

			if flag_check
				if @@menu_count[item]==0
					print "Sorry, Item Is Not Available!"
					puts ''
				else
					print "Item Added To Your Bag!"
					puts''
          @@menu_count[item]-=1
          @ordered_item.each do |key,value|
						if key==item
							flag_in=true
						end
				end
			end

			if flag_in
				@ordered_item[item]+=1
			else
				@ordered_item[item]=1
			end
			else
				print "You Entered Wrong Item!!!"
				puts ''
			end

			print "If You Want To Order?[y/n]"
			puts ''
			option=gets.chomp
			if option=='n'
				print "Your Order Summary :"
				puts ''
				@ordered_item.each do |key,value|
					print "Dish: #{key}   Quantity: #{value}"
					puts ''
				end
				flag=false
				@status=true
			end
		end
	end
end

customer=Food_Ordering_System.new
flag=true
while(flag)
	puts "*********Please Select Any Option*********"
	puts "1.Display Menu"
	puts "2.Check Availability Of Item"
	puts "3.Accept Order"
	puts "4.Order Status"
	option=gets.to_i
	case option
		when 1
			customer.display_menu
		when 2
			customer.check_item
		when 3
			if customer.status==false
			customer.accept_order
		  else
		  	print "You Cannot Order Further, As You Already Have An Order!"
		  	puts ''
		  end
		when 4
			customer.check_status
		else
			print "Invalid Input!!!Please Enter Item Mentioned in the"
			puts ''
	end

	print "If You Want To Continue?[y/n]"
	puts ''

	option=gets.chomp
	if option=='n'
		flag=false
	end
end

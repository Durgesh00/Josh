class Account
  @balance
  @user_id
  @@Account_id=0
	def initialize
    @balance=0.0
    @@Account_id+=1
    @user_id=@@Account_id
	end

	def deposit
    puts "Enter the Amount you want to deposit "
    amt=gets.chomp.to_i
    @balance+=amt
    puts @balance.class
	end

	def withdraw
		puts "Enter the Amount you want to withdraw"
		amt=gets.chomp.to_i
		if amt>@balance
			puts "Sorry !!! You Don't have this much balance"
		else
			puts "Amount withdrawn"
			@balance-=amt
		end

	end

	def get_balance
     puts "Do you want to check your balance(y/n)"
     choice=gets.chomp
     if choice=='y'
     	 puts "balance :", @balance
     end
	end

end

class Current_account <Account
	@@curr_roi=0.54
	def calc_roi
		puts "Enter the number of month for which you want to know the interest"
		mon_no=gets.chomp.to_f
		if @balance==0
			puts "Add some money here"
		else
		  interest=mon_no*@balance*@@curr_roi/12.00
		  puts "Amount :",'   ',interest
		  puts ' ' 
		end
	end
end

class Saving_account <Account
		@@curr_roi=0.86
	  def calc_roi
		puts "Enter the number of month for which you want to know the interest"
		mon_no=gets.chomp.to_f
		if @balance==0
			puts "Add some money here"
		else
		  interest=mon_no*@balance*@@curr_roi/12.00
		  puts "Amount :",'   ',interest
		  puts ' ' 
		end
	end
end


puts "========Open Account=======\n"
print "1.Current\n"
print "2.Saving\n"
option=gets.to_i
	case option
		when 1
			obj=Current_account.new
		when 2
			obj=Saving_account.new
		else
			print "Invalid Input!!!Please Enter a valid type"
			puts ''
	end

flag=true
while(flag)
	print "=========Choose from the following==============\n"
	print "1.Withdraw Money\n"
	print "2.Deposit Money\n"
	print "3.Check Balance\n"
	print "4.Calculate Interest\n"

	option=gets.to_i
	case option
		when 1
			obj.withdraw
		when 2
			obj.deposit
		when 3
      obj.get_balance
		when 4
			obj.calc_roi
		when 5
			break
		else
			print "Invalid Input!!!Please Enter a valid choice"
			puts ''
	end
end


	

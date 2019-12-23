module Check_country

  def Loan? population, gdp, state

    return true if population >= 2000000 && gdp >= 1000 && state == 'developing'
    false

  end

  def Seat? population, gdp, states, state
    return true if population >= 200000 && gdp >= 1500 && states >= 20 && state == 'developed'
    false
  end

  def War? army_str
    return true if army_str >= 20000 
    false
  end

end


class Country

  include Check_country

  attr_accessor :population, :country_name, :gdp, :num_states, :army_str, :state_of_ctr, :country_code
  @@code = 0

  def initialize c_name, population, gdp, states, army_strength, state 

    @country_name = c_name
    @population = population
    @gdp = gdp
    @num_states = states
    @army_str = army_strength   
    @state_of_ctr = state
    @@code += 1
    @country_code = @@code
  
  end

  def Loan? population=self.population, gdp=self.gdp, state=self.state_of_ctr
    super
  end

  def Seat? population=self.population, gdp=self.gdp, states=self.num_states, state=self.state_of_ctr
    super
  end

  def War? population=self.army_str
    super
  end
   
end

def create_obj

  puts "Enter The Name Of The Country :"
  country_name = gets.chomp
  puts "Enter Population Of The Country :"
  population = gets.chomp.to_i
  puts "Enter GDP Of The Country:"
  gdp = gets.chomp.to_i
  puts "Enter Number Of States In The Country :"
  states = gets.chomp.to_i
  puts "Enter Strength Of Army :"
  army_strength = gets.chomp.to_i
  puts "Enter The State Of Country (developing/developed)? :"
  state = gets.chomp
  country_object = Country.new country_name, population, gdp, states, army_strength, state
  puts "Country code of #{country_name} is #{country_object.country_code}"
  country_object

end

countries = []
ch = 0
ind = 0

while ch != 4

  puts "-------------Menu--------------"
  puts "1. Enter details of country"
  puts "2. Show details of a country"
  puts "3. Check applicability"
  puts "4. Exit"
  
  ch = gets.chomp.to_i

  case ch
  when 1

    countries.push(create_obj)
    ind+=1

  when 2

    puts "Enter Country Code"

    cd = gets.chomp.to_i

    if cd > 0 && cd <= ind
    
      cd -= 1
      puts "Country name : #{countries[cd].country_name} (code : #{countries[cd].country_code})"
      puts "Population : #{countries[cd].population}"
      puts "GDP : #{countries[cd].gdp}"
      puts "Number of States : #{countries[cd].num_states}"
      puts "Army Strength : #{countries[cd].army_str}"
      puts "State of #{countries[cd].country_name}: #{countries[cd].state_of_ctr}"

    else
      puts "invalid country code"
    end

  when 3

    puts "Enter Country Code"

    cd = gets.chomp.to_i

    if cd > 0 && cd <= ind
    
      cd -= 1
      puts "\n1. Check applicable for loan from IMF"
      puts "2. Check country can have a seat in UNSC"
      puts "3. Check if country can win war"

      chk = gets.chomp.to_i

      case chk
      
      when 1
        
        if countries[cd].Loan?
          puts "#{countries[cd].country_name} is applicable for loan"
        else
          puts "#{countries[cd].country_name} is not applicable for loan"
        end

      when 2

        if countries[cd].Seat?
          puts "#{countries[cd].country_name} can have a seat in UNSC"
        else
          puts "#{countries[cd].country_name} cant get a seat in UNSC"
        end

      when 3
        
        if countries[cd].War?
          puts "#{countries[cd].country_name} can win war"
        else
          puts "#{countries[cd].country_name} cannot win war"
        end

      else
        puts "invalid choice"
      end

    else
      puts "invalid country code"
    end

  when 4
    break
  else
    puts "invalid choice"
  end

end
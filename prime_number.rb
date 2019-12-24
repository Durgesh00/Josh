puts "Enter a number"
n = gets.to_i

def prime(n)
  return false if n < 2
  (2..n/2).none?{|i| n % i == 0}
end

result = prime n
if result
  puts "#{n} is prime!"
else
  puts "#{n} is not prime."
end



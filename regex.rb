print "Enter mobile number"
n=gets

if n.match(/\A[1-9]{1}[0-9]{9}\Z/)
	print "A Mobile number"
else 
	print "Not a mobile number"
end

puts " "
puts " "

print "Enter PAN number"
n=gets

if n.match(/[A-Z]{5}[0-9]{4}[A-Z]{1}/)
	print "A valid PAN number"
else 
	print "Not a valid PAN number"
end

puts " "
puts " "

print "Enter a email address"
n=gets

if n.match(/\A[a-zA-Z0-9]+[.,_]*[a-zA-Z0-9]*[@][a-zA-Z0-9]+[.][a-zA-Z0-9]+\Z/)
	print "A valid email address"
else 
	print "Not a valid email address"
end

puts " "
puts " "

print "Enter gender"
n=gets

if n.match(/\A[MFmf]+\Z/)
	print "Valid"
elsif match(/\A[F]+\Z/)
	print "Invalid"
end

print "Enter a name"
n=gets

if n.match(/\A[a-zA-Z' ']+\Z/)
	print "A valid name"
else 
	print "Not a valid name"
end

puts " "
puts " "

print "Enter a amount"
n=gets

if n.match(/\A[0-9]*[.]?[0-9]+\Z/)
	print "A valid amount"
else 
	print "Not a valid amount"
end

puts " "
puts " "
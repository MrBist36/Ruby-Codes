def add(a,b)
    a+b
end

def subtract(a,b)
    a-b
end

def multiply(a,b)
    a*b
end

def divide(a,b)
    if b!=0
        a/b
    else
        puts "Invalid operation"
    end
end

puts"Hay!! I am calculator"
puts"Enter first number"
num1=gets.to_f

puts"Enter the second number"
num2=gets.to_f

puts "Enter 
 1) for sum
 2) for sub 
 3) for multiply 
 4) for divide"
 
operation=gets.to_i

case operation
when 1
    puts "Sum is #{add(num1,num2)}"
when 2
    puts "Sub is #{subtract(num1,num2)}"
when 3
    puts "Multiple is #{multiply(num1,num2)}"
when 4
    puts "Division is #{divide(num1,num2)}"
else
    puts "Invalid Operation"
end

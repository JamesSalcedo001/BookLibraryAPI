=begin hello 
this
is 
james
=end

#multiline comment

#####


## conditional statements


# if elsif else

if age > 18
    puts "You are an adult"
elsif age == 18
    puts "Just turned adult"
else
    puts "you are not an adult"
end


# inline if modifier

temperature = 22
puts "It's a bit chilly out there." if temperature < 25


# unless 

rainy = false

unless rainy
    puts "Let's go for a walk!"
else
    puts "We should stay inside."
end


# inline unless modifier

battery_level = 10
puts "Battery low!" unless battery_level > 20



# ternary operator

age = 15
status = age >= 18 ? "adult" : "minor"
puts "You are a(an) #{status}." # => minor



# case statement

day = "Monday"

case day
when "Monday"
    puts "Start of the work week"
when "Friday"
    puts "End of the work week!"
else
    puts "Just another day"
end


# nested conditional statements

age = 25
member = true

if age > 21
    if member
        puts "Welcome to the club!"
    else
        puts "Membership required"
    end
else
    puts "You must be over 21"
end

#####


## loops while, until, for, and iterating methods like each etc


# times iterator

3.times do |i|
    puts "Iteration #{i}" # => Iteration 1
end                       # => Iteration 2
                          # => Iteration 3


# while loop

count = 1

while counter <= 5
    puts "Iteration #{counter}"  # =>  Iteration 1
    counter += 1                 # =>  Iteration 2
end                              # =>  Iteration 3
                                 # =>  Iteration 4
                                 # =>  Iteration 5



# until loop

counter = 1

until counter > 5
    puts "Iteration #{counter}" # => Iteration 1
    counter += 1                # => Iteration 2
end                             # => Iteration 3
                                # => Iteration 4
                                # => Iteration 5



# for loop

for number in 1..5
    puts "Number #{number}" # => Iteration 1
end                         # => Iteration 2
                            # => Iteration 3
                            # => Iteration 4
                            # => Iteration 5



# each iterator

[1, 2, 3, 4, 5].each do |number|
    puts "Number #{number}"     # => Number 1
end                             # => Number 2
                                # => Number 3
                                # => Number 4
                                # => Number 5



# upto iterator

1.upto(5) do |i|
    puts "Counting up: #{i}" # => Counting up: 1
end                          # => Counting up: 2
                             # => Counting up: 3
                             # => Counting up: 4
                             # => Counting up: 5


# downto iterator

5.downto(1).do |i|
    puts "Counting down: #{i}" # => Counting down: 5
end                            # => Counting down: 2
                               # => Counting down: 3
                               # => Counting down: 4
                               # => Counting down: 5




# map iterator

squared_numbers = [1, 2, 3, 4 ,5].map do |number|
        number * number
end
puts squared_numbers.inspect # => [1, 4, 9, 16, 25]



# select iterator

even_numbers = [1, 2, 3, 4, 5].select do |number|
    number.even?
end
puts even_numbers.inspect # => [2, 4]


# reject iterator

odd_numbers = [1, 2, 3, 4, 5].reject do |number|
    number.even?
end
puts odd_numbers.inspect # => [1, 3, 5]


# each_with_index

["a", "b", "c"].each_with_index do |item, index|
    puts "#{index}: #{item}"  # => 0: a
end                           # => 1: b
                              # => 2: c






#####


## common string methods

# length/size

"hello".length # => 5
"hello".size # => 5


# gsub
"hello world".gsub("world", "Ruby") # => "hello Ruby"

# include?
"hello world".include?("world") # => true

# index
"hello world".index("world") # => 6


# chomp
"hello\n".chomp # => "hello"

# chop
"hello".chop # => "hell"

# squeeze
"hellooooo".squeeze # => "helo"

# swapcase
"Hello World".swapcase # => "hELLO wORLD"

# center
"hello".center(10) # => "  hello   "

# ljust
"hello".ljust(10, ".") # => "hello....."

# rjust
"hello".rjust(10, "-") # => "-----hello"

# delete
"hello world".delete("l") # => heo word

# slice
"hello world".slice(0, 5) # => "hello"
"hello world".slice(6..10) # => "world"


# capitalize
"hello world".capitalize # => "Hello world"

# reverse
"hello".reverse # => "olleh"

"1,2,3".split(",") # => ["1", "2", "3"]

# length
"hello".length # => 6

# upcase
"hello".upcase # => "HELLO"

# downcase
"HELLO".downcase # => "hello"

# strip
"     hello     ".strip # => "hello"




## common numerical methods


# even
10.even? # => true

# odd
10.odd? # => false

# round
3.14159.round(2) # => 3.14
3.14159.round # => 3

# ceil
2.3.ceil # => 3

# floor
2.9.floor # => 2


# abs
-10.abs # => 10

# next 
10.next # => 11

# pred
10.pred # => 9

# divmod
10.divmod(3) # => [3, 1]

# gcd
12.gcd(16) # => 4

# lcd
3.lcm(7) # => 21

# downto
5.downto(1) { |n| print n, " " } # => 5 4 3 2 1

# upto
1.upto(5) { |n| print n, " " } # => 1 2 3 4 5


# times
3.times do { |i| print, " "} # => 0 1 2

# step
1.step(10, 2) { |i| print i, " " } # => 1 3 5 7 9

# nan?
(0.0 / 0.0).nan? # => true

# finite
(1.0 / 0.0).finite? # => false

# ininite
(1.0 / 0.0).inifinite? # => 1 (positive infinity)



# zero? 
num1 = 0 
puts num1.zero? # => true

# to_i
5.7.to_i                 # => 5
"12345".to_i             # => 12345
"99 red balloons".to_i   # => 99
"0a".to_i                # => 0
"0a".to_i(16)            # => 10
"hello".to_i             # => 0
"1100101".to_i(2)        # => 101
"1100101".to_i(8)        # => 294977
"1100101".to_i(10)       # => 1100101
"1100101".to_i(16)       # => 17826049

# to_f
   
# Initializing the number 
num1 = 5
num2 = 10
num3 = 1678 
num4 = 1897.90
   
# Prints the int as float 
puts num1.to_f # => 5.0
puts num2.to_f # => 10.0
puts num3.to_f # => 1678.0
puts num4.to_f # => 1897.9


# hashes

person = { name: "James", age: 28 }

# accessing values through bracket notation
puts person[:name] # => James

person[:gender] = "Male"

puts person # => { name: "James", age: 28, gender: "Male" }




## common hash methods



# keys
hash = {a: 1, b: 2, c: 3 }
hash.keys # => [:a, :b, :c]

# values
hash.values # => [1, 2, 3]

# each

person.each do |key, value|
    puts "#{key}: #{value}" # => name: James
end                         # => age: 28
                            # => gender: Male

hash.each do |key, value|
    puts "#{key} => #{value}" # =>  a => 1
end                           # =>  b => 2
                              # =>  c => 3



# each_key
hash.each_key { |key| puts key } # => a
                                 # => b
                                 # => c

# each_value
hash.each_value { |value| puts value } # => 1
                                       # => 2
                                       # => 3


# fetch
hash.fetch(:a) # => 1
hash.fetch(:b, "Not found") # => "Not found"

# merge
hash1 = {a: 1, b: 2}
hash2 = {b: 3, c: 4}
hash1.merge(hash2) # => {:a=>1, :b=>3, :c=> 4}

# invert
hash.invert # => { 1 => :a, 2 => :b, 3 => :c }


# delete
hash.delete(:b) # => 2
# hash is now {:a=>1, :c=>3}


# select
hash.select { |key, value| value > 1 } # => {:b=>2, :c=>3}
numbers.select { |num| num.even? } # => [2, 4, 6]


# reject
hash.reject { |key, value| value > 1 } # => {:a=> 1}

# access or assign a value
hash[:a] # => 1
hash[:d] = 4 # => hash now {a: 1, b: 2, c: 3, d: 4}


# compact
hash = { a: 1, b: nil, c: 3}
hash.compact # => { a: 1, c: 3}

# dig
hash = { a: { b: { c: 1 } } }
hash.dig(:a, :b, :c) # => 1


# arrays

numbers = [1, 2, 3, 4, 5]

# access elements by index
numbers[0] # => 1

## shovel operator
numbers << 6 # => [1, 2, 3, 4, 5, 6]
numbers << 7 # => [1, 2, 3, 4, 5, 6, 7]


## common array methods

# push
numbers.push(6) # => [1, 2, 3, 4, 5, 6]

# pop
numbers.pop # => [1, 2, 3, 4, 5]

# shift
numbers.shift # => [2, 3, 4, 5]

# unshift
numbers.unshift(0) # => [0, 2, 3, 4, 5]

# delete
numbers.delete(2) # => [1, 3, 4, 5]

# delete_at
numbers.delete_at(1) # => [1, 3, 4, 5]

# length
numbers.length # => 5

# compact
num_arr = [1, nil, 2, nil, 3]
num_arr.compact # => [1, 2, 3]

# flatten
arr = [1, [2, 3], [4, [5]]]
arr.flatten # => [1, 2, 3, 4, 5]

# uniq
copy_arr = [1, 1, 2, 2, 2, 3, 3, 4, 5, 5, 5]
copy_arr.uniq # => [1, 2, 3, 4, 5]

# sort
unsorted = [3, 1, 2]
unsorted.sort # => [1, 2, 3]

# each
numbers.each { |num| puts num } # => 1 2 3


# sum
numbers.sum # => 15

# min
numbers.min # => 1

# max
numbers.max # => 5

# first
numbers.first # => 1
numbers.first(3) # => [1, 2, 3]

# last
numbers.last # => 5
numbers.last(2) # => [4, 5]

# sample
numbers.sample # => 3 (random)
numbers.sample(2) # => [1, 5] (random)

# reverse
numbers.reverse # => [5, 4, 3, 2, 1]

# include?
numbers.include?(2) # => true
numbers.include(8) # => false 

# map
numbers.map { |num| num * 2 } # => [2, 4, 6, 8, 10]

# zip
arr1 = [1, 2, 3]
arr2 = ["a", "c", "c"]
arr1.zip(arr2) # => [[1, "a"], [2, "b"], [3, "c"]]


# join
arr = ["Hello", "World"]
arr.join(" ") # => "Hello World"


######


# methods



# default parameters

def greet(name = "James")
    puts "Hello, #{name}"
end

puts greet # => "Hello, James"
puts greet("Binx") # => "Hello, Binx"


# keyword arguments or kwargs

def describe_person(name:, age:)
    puts "#{name} is #{age} years old"
end

describe_person(name: "Alice", age: 30) # Alice is 30 years old


# default kwargs

def describe_person(name:, age: 18)
    puts "#{name} is #{age} years old" 
end

describe_person(name: "Bob") # Bob is 18 years old


# Variable num of arguments splat operator

def greet_many(*names)
    names.each { |name| puts "Hello, #{name}!" }
end

greet_many("Alice", "Bob", "Carol") # => Hello, Alice!
                                    # => Hello, Bob!
                                    # => Hello, Carol!


# Double splat used for keyword arguments passing in unspecified number of kwargs as a hash

def describe_people(**people)
    people.each { |name, age| puts "#{name} is #{age} years old" }
end
 
describe_people(Alice: 28, Bob: 25) # => Alice is 28 years old
                                    # => Bob is 25 years old



# mixed arguments, regular, keyword, splat arguments

def mixed_args(a, b, *c, d:, e:, **f)
    puts "a: #{a}, b: #{b}, c: #{c.inspect}, d: #{d}, e: #{e}, f: #{f.inspect}"
end

mixed_args(1, 2, 3, 4, d: 5, e: 6, x: 7, y: 8)  # => a: 1, b: 2, c: [3, 4], d: 5, e: 6, f: {:x=>7, :y=>8}


## error handling 

begin 
    # code that may raise an exception
rescue SomeSpecificException => e
    # code to run if the exception is raise
ensure
    # code that will always run regardless of an exception being raised or not
end

# begin and rescue

begin
    1 / 0
rescue ZeroDivisionError => e
    puts "Can't divide by zero!"
    puts "Error: #{e.message}"


# ensure

file = File.open("example.txt")
begin 
    # read from file or perform operations
rescue => e
    puts "an error occurred: #{}"
ensure
    file.close
    puts "closed file"
end


# retry

attempts = 0

begin
    attempts += 1
    puts "Trying to do something..."
    # line of code that might fail
rescue
    retry if attempts < 3
    puts "Failed after 3 attempts"
end


# inline rescue
result = 1 / 0 rescue "Can't divide by zero"
puts result # output: can't divide by zero


# raising exceptions with 'raise'

def calculate_division(dividend, divisor)
    raise ArgumentError, "divisor cannot be zero" if divisor == 0
    dividend / divisor
end

begin
    calculate_division(10, 0)
rescue ArgumentError => e
    puts e.message
end

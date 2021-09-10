using Printf
using Statistics

# DATA TYPES CONVERSION
# Convert float to integer
i = UInt64(trunc(3.14))
println(i)

# Convert string to float
f = parse(Float64, "123")
println(f)

# Convert string to integer
i2 = parse(Int64, "111")
println(i2)

###

# STRINGS
s = "See if this adds a line\nIt does!"
println(s)

# Ranges
println(length(s))
println(s[1:3])
println(s[5:end])

# Concatenation
s1 = string("Branko", " MV")
println(s1)
println("Branko" * " MV")

# Interpolation
i_1 = 1
i_2 = 2
println("$i_1 + $i_2 = $(i_1 + i_2)")

# Multi-ligne strings
s2 = """
Hello
I
am
Branko
"""
println(s2)

# Comparison between strings
println("SIUUU" > "No")
println("SIUUU" == "MAOOO")
println(length("SIUUU") == length("MAOOO"))

# Finding indexes
println(findfirst(isequal('i'), "Fariseo"))
println(occursin("key", "monkey"))

###

# CONDITIONALS

#Using elseif and 'end' at the end
age = 7
if age >= 5 && age <= 6
    println("Between 5 and 6")
elseif age > 6 && age <= 10
    println("Between 6 and 10")
else
    println("Not between 5 and 6")
end

# printf
@printf("true || false = %s", true || false ? "true" : "fasle")

###

# LOOPING

# While and global variables
i = 1
while i < 20
    if (i % 2) == 0
        println(i)
        global i += 1
        continue
    end
    global i += 1
    if i >= 10
        break
    end
end

# For and ranges
i = 1
for i = 1:4
    println(i * 2)
end

# For and arrays
for i in [2,4,6,8]
    println(i)
end

# For loop for coordinates, here j takes step 3
for i = 1:5 , j = 2:3:14
    println((i,j))
end

###

# ARRAYS

# Creating arrays
a = zeros(Int128, 2, 2)
println(a)
b = Array{Int32}(undef, 5)
println(b)
c = Float64[]
println(c)

# Seeing how many elements of the array satisfy a condition
a4 = [1,2,3]
f(a) = (a >= 2) ? true : false
println(findall(f, a4))
println(length(findall(f, a4)))

# Array operations
println(size(a4))
println(sum(a4))
println(maximum(a4))
splice!(a4, 2:1, [5,6,7]) # Insert elements
println(a4)
splice!(a4, 2:3) # Remove elements
println(a4*2)

# Arrays can store different data types
a5 = [1, 3.14, "Hello"]

# Arrays can store functions
a6 = [sin, cos, tan]
for i in a6
    println(i(0))
end

# Multidimensional Arrays
ex_array = [1 2 3; 4 5 6; 7 8 9]
println(ex_array)
v = transpose(ex_array)
println(v)

for i = 1:3
    @printf("%d ", ex_array[i, i])
end # Only diagonal

for i = 1:3, j = 1:3
    @printf("%d ", ex_array[i,j])
end # All entries

for i = 1:3, j = 2
    @printf("%d ", ex_array[i,j])
end # Every row in the second column

a_ex = collect(2:3:14)
println(a_ex)
g = transpose(a_ex)
println(g)

for i in a_ex
    println(i)
end # Vertical print

for i = 1:length(a_ex), j = 1
    @printf("%d ", a_ex[i,j])
end # Horizontal print

# Creating arrays with comprehension
arr_ex = [n^2 for n in 1:5]
println(arr_ex)

a11 = [n * m for n in 1:5, m in 1:5]
println(a11)

# Add elements at the end of the array
push!(arr_ex, 36)
println(arr_ex)

# Random values for an array
a12 = rand(0:9, 5, 5)
for n = 1:5, m = 1:5
    println(a12[n,m])
end # Entry by entry

for n = 1:5
    for m = 1:5
        print(a12[n, m])
    end
    println()
end # Ordered entries

###

# TUPLES: Their values cannot be changed once they are defined

# We use parenthesis
t1 = (1,2,3,4)
println(t1)

t2 = ((1,2),(3,4))
println(t2)

# Kinda similar to dictionnaries. It is coming!
t3 = (sue = ("Sue", 100), paul = ("Paul", 50))
println(t3)
println(t3.sue)
println(t3.paul)

###

# DICTIONNARIES: Key - value pairs where the key is unique

# Setting a dictionnary up
d1 = Dict("pi" => 3.14, "e" => 2.71)
println(d1["pi"])
println(d1["e"])

# Adding/Deleting elements in a dictionnary
d1["golden-ratio"] = 1.6
println(d1)

delete!(d1, "pi")
println(d1)

# Looking for exisitng keys
println(haskey(d1, "e"))

# Looking for existing values
println(in(d1, "pi"=>3.14))

# Display all keys/values
println(keys(d1))
println(values(d1))

for i in d1
    println(i)
end

for (key, value) in d1
    println(key, " : ", value)
end

###

# SETS: Similar to arrays, but every value must be unique (MIN. 30)

# Uniqueness of elements
st1 = Set(["Jim", "Pam", "Jim"])
println(st1)

# Adding new elements
push!(st1, "Dwight")
println(st1)

# Check if there is an existing value
println(in("Michael", st1))

# Combining sets: Union, intersection, difference
st2 = Set(["Oscar", "Angela"])
st3 = Set(["Kevin", "Pam"])
println(union(st1, st2))
println(intersect(st1, st3))
println(setdiff(st1, st3))

###

# FUNCTIONS

# Simple function
getSum(x,y) = x + y
x, y = 1, 5
@printf("%d + %d = %d", x, y, getSum(x,y))

# Defining a function
function canIVote(age=16)
    if age > 18
        println("Can Vote!")
    else
        println("Cannot Vote!")
    end
end

canIVote()
canIVote(20)

# This does not change v1
v1 = 5
function changeV1(v1)
    v1 = 10
end
changeV1(v1)
println(v1)

# This changes v1. See how we use global
v1 = 5
function changeV1(v1)
    global v1 = 10
end
changeV1(v1)
println(v1)

# Function that accepts several arguments
function getSum2(args...)
    sum = 0
    for a in args
        sum += a
    end
    println(sum)
end

getSum2(1,2,3,4,5,6,7,8,9,10)

# Return multiple values
function next2(val)
    return(val+1, val +2)
end
next2(5)

# Functions that return functions
function makeMultiplier(num)
    return function(x)
        return x * num
    end
end
mult3 = makeMultiplier(3)
println(mult3(6))

# Different types of arguments
function getSum3(num1::Number, num2::Number)
    return num1 + num2
end
function getSum3(num1::String, num2::String)
    return parse(Int32,num1) + parse(Int32, num2)
end

println("5 + 4 = ", getSum3(5,4))
println("5 + 4 = ", getSum3("5","4"))

# Anonymus functions. map applies function to each item
v2 = map(x -> x*x, [1,2,3])
println(v2)

v3 = map((x,y) -> x+y, [1,2], [3,4])
println(v3)

# Using reduce allows to use a function multiple times to get a reuslt
v4 = reduce(+, 1:100)
println(v4)

sentence = "This is a string"
string_array = split(sentence)
longest = reduce((x,y) -> length(x) > length(y) ? x : y, string_array)
println(longest)

# Math functions
@printf("5 + 4 = %d\n", (5 + 4))
@printf("5 - 4 = %d\n", (5 - 4))
@printf("5 * 4 = %d\n", (5 * 4))
println("5 / 4 = ", (5/4))
println("5 % 4 = ", (5 % 4))
@printf("5 ^ 4 = %d\n", (5 ^ 4))
@printf("round(3.5) = %d\n", round(3.5))
@printf("floor(3.5) = %d\n", floor(3.5))
@printf("ceil(3.5) = %d\n", round(3.5))
println("abs(-3.5) = %d\n", abs(-3.5))
@printf("sqrt(100) = %d\n", sqrt(100))
@printf("cbrt(512) = %d\n", cbrt(512))
@printf("hypot(90,90) = %d\n", hypot(90,90))
println("exp(2) = %d\n", exp(2))
println("log(100) = %d\n", log(100))
println("log2(100) = %d\n", log2(100))
println("log10(100) = %d\n", log10(100))

x = 5
println(2x)

# Dot operator for each entry
a13 = [1,2,3]
println(a13 .* 3)

###

# ENUMERATED TYPES

#
@enum Color begin
    red = 1
    blue = 2
    green = 3
end
favColor = green::Color
println(favColor)

###

# SYMBOLS: Immutable strings

# Create a symbol
:Derek
println(:Derek)
typeof(:Derek)

# They are commonly used as keys within dictionnaries
d2 = Dict(:pi => 3.14, :e => 2.71)
println(d2[:pi])

####

# STRUCTS: Composite types (contains different fields)

# Features are immutable
struct Customer
    name::String
    balance::Float32
    id::Int
end
bob = Customer("Bob Smith", 10.5, 1)
println(bob.name)
println(bob.balance)

###

# ABSTRACT TYPES: Like STRUCTS but they can have subtypes

# Deriving Cat and Dog from Animal
abstract type Animal end

struct Dog <: Animal
    name::String
    bark::String
end

struct Cat <: Animal
    name::String
    meow::String
end

puppy = Dog("Duke", "Ruff")
muffino = Cat("Garfield", "Miau")

function makeSound(animal::Dog)
    println("$(animal.name) says $(animal.bark)")
end

function makeSound(animal::Cat)
    println("$(animal.name) says $(animal.meow)")
end

makeSound(puppy)
makeSound(muffino)

###

# EXCEPTION HANDLING - USER INPUT

# Avoiding division by zero
print("Enter a number ")
num1 = chomp(readline())
print("Enter a number ")
num2 = chomp(readline())

try
    val = (parse(Int32, num1)) / (parse(Int32, num2))
    if (val == Inf)
        error("Cannot divide by zero")
    else
        println(val)
    end
catch e
    println(e)
end

###

# FILE IO

# Manipulation of a file

# Creation
open("random2310.txt", "w") do file
    write(file, "Here is some information\nIt is fantastic!")
end

# Reading it
open("random2310.txt") do file
    data = read(file, String)
    println(data)
end

# Reading it line by line
open("random2310.txt") do file
    for line in eachline(file)
        println(line)
    end
end

###

# MACROS: They generate code for you before a program is run

# Printing an expression n times
macro doMore(n, exp)
    quote
        for i = 1:$(esc(n))
            $(esc(exp))
        end
    end
end
@doMore(3, println("Hello"))

#
macro doWhile(exp)
    @assert exp.head == :while
    esc(quote
    $(exp.args[2])
    $exp
end)
end
z = 0
@doWhile while z < 10
    global z += 1
    println(z)
end
println("Yes!")

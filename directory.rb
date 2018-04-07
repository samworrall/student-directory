#Let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  while count < students.length do
    if students[count][:name].chr.upcase == 'S' && students[count][:name].length < 12
      puts "#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)"
    end
    count += 1
   end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#Nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

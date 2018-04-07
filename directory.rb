#Let's put all students into an array
def input_students
  puts "Please enter the names of the students, aswell as their hobbies, country of origin, and hieght."
  puts "To finish, just hit return twice"
  students = []
  while true do
  puts "name?"
  name = gets.chomp
    if name.empty?
      break
    end
  puts "hobby?"
  hobby = gets.chomp
  puts "Country of origin?"
  country = gets.chomp
  puts "height?"
  height = gets.chomp
  students << {name: name, cohort: :november, hobby: hobby, country: country,
  height: height}
  puts "Now we have #{students.count} students"
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
      puts "#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort),
      hobbies inlcude #{students[count][:hobby]}, they are from #{students[count][:country]}
      and are #{students[count][:height]} tall!"
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

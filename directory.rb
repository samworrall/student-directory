def input_students
  puts "Please enter the names of the students, aswell as a hobby of theirs, their country of origin, and height."
  puts "To finish, just hit return twice"
  students = []
  while true do
  puts "What is their name?"
  name = gets.chomp
    if name.empty?
      break
    end
  puts "What is a hobby of theirs?"
  hobby = gets.chomp
  puts "What is their country of origin?"
  country = gets.chomp
  puts "What is their height?"
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
  i = 0
  while i < students.length do
    if students[i][:name].chr.upcase == 'S' && students[i][:name].length < 12
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort),
      hobbies inlcude #{students[i][:hobby]}, they are from #{students[i][:country]}
      and are #{students[i][:height]} tall!"
    end
    i += 1
   end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

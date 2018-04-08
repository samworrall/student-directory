def input_students
  puts "Please enter the names of the students, aswell as their cohort, a hobby of theirs, their country of origin, and height."
  puts "To finish, just hit return twice"
  students = []
  while true do
  puts "What is their name?"
  name = gets.delete("\n")
    if name.empty?
      break
    end
  puts "What is their cohort month?"
  cohort = gets.delete("\n").capitalize
  puts "What is a hobby of theirs?"
  hobby = gets.delete("\n")
  puts "What is their country of origin?"
  country = gets.delete("\n")
  puts "What is their height?"
  height = gets.delete("\n")
  if cohort.empty?
    cohort = "November"
  end
  students << {name: name, cohort: cohort.to_s, hobby: hobby, country: country,
  height: height}
  puts "Now we have #{students.count} " + (students.count > 1 ? "students" : "student")
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print_by_cohort(students)
  if !students.empty?
    cohorts = students.map do |student|
      student[:cohort]
    end
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort: "
      students.each do |student|
        if student[:cohort].to_s == cohort
          puts student[:name]
        end
      end
    end
  end
end

def print(students)
  i = 0
  while i < students.length do
    if students.empty?
      break
    elsif students[i][:name].chr.upcase == 'S' && students[i][:name].length < 12
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)".center(80)
      puts "Hobbies inlcude #{students[i][:hobby]}".center(80)
      puts "From #{students[i][:country]}".center(80)
      puts "#{students[i][:height]} tall".center(80)
    end
    i += 1
   end
end

def print_footer(students)
  puts ("Overall, we have #{students.count} great " + (students.count == 1 ? "student" : "students")).center(80)
end

students = input_students
print_header
print(students)
print_by_cohort(students)
print_footer(students)

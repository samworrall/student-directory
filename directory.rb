@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Print the students by cohort"
  puts "4. Save the list to students.csv"
  puts "5  Load the list from students.csv"
  puts "9. Exit"
end

def input_students
  puts "Please enter the names of the students, aswell as their cohort, a hobby of theirs, their country of origin, and height."
  puts "To finish, just hit return twice"
  while true do
  puts "What is their name?"
  name = STDIN.gets.delete("\n")
    if name.empty?
      break
    end
  puts "What is their cohort month?"
  cohort = STDIN.gets.delete("\n").capitalize
  puts "What is a hobby of theirs?"
  hobby = STDIN.gets.delete("\n")
  puts "What is their country of origin?"
  country = STDIN.gets.delete("\n")
  puts "What is their height?"
  height = STDIN.gets.delete("\n")
  if cohort.empty?
    cohort = "November"
  end
  @students << {name: name, cohort: cohort.to_s, hobby: hobby, country: country,
  height: height}
  puts "Now we have #{@students.count} " + (@students.count > 1 ? "students" : "student")
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print_students_list
  i = 0
  while i < @students.length do
    if @students.empty?
      break
    elsif @students[i][:name].chr.upcase == 'S' && @students[i][:name].length < 12
      puts "#{i + 1}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(80)
      puts "Hobbies inlcude #{@students[i][:hobby]}".center(80)
      puts "From #{@students[i][:country]}".center(80)
      puts "#{@students[i][:height]} tall".center(80)
    end
    i += 1
   end
end

def print_footer
  puts ("Overall, we have #{@students.count} great " + (@students.count == 1 ? "student" : "students")).center(80)
end

def print_by_cohort
  if !@students.empty?
    cohorts = @students.map do |student|
      student[:cohort].to_s 
    end
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort: "
      @students.each do |student|
        if student[:cohort].to_s == cohort
          puts student[:name]
        end
      end
    end
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:country], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobby, country, height = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby, country: country, height: height}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      print_by_cohort
    when "4"
      save_students
    when "5"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu

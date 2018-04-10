#print its own source code
File.open($0, "r") do |file|
  file.readlines.each do |line|
    puts line
  end
end 

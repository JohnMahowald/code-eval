def read_more(line)
  return line if line.length <= 55
  
  i = 39
  until line[i] == " " || i <= 0
    i -= 1
  end
  
  append = "... <Read More>"
  i <= 0 ? "#{line[0...40]}#{append}" : "#{line[0...i]}#{append}"
end

File.open(ARGV[0]).each_line do |line|
  puts read_more(line.chomp)
end

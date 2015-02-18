def swap_case(string)
  i = 0
  result = ""
  string.each_char do |char|
    if char =~ /\w/
      result += (i % 2 == 0 ? char.upcase : char )
      i += 1
    else
      result += char
    end
  end
  result
end

File.open(ARGV[0]).each_line do |line|
  puts swap_case(line.chomp)
end

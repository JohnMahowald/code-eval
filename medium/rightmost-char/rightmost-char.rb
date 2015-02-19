def rightmost_char(str, char)
  str.length.downto(0).each do |i|
    return i if str[i] == char
  end

  return -1
end

File.readlines(ARGV[0]).each do |line|
  string, char = line.chomp.split(",")
  puts rightmost_char(string, char)
end

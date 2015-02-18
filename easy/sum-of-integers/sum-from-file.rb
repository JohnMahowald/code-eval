x = 0

File.readlines(ARGV[0]).each do |line|
  x += line.chomp.to_i
end

puts x

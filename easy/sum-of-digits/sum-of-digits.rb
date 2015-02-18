def sum(num)
  return num if (num / 9) == 0
  (num % 10) + sum(num / 10)
end

File.readlines(ARGV[0]).each do |line|
  puts sum line.chomp.to_i
end

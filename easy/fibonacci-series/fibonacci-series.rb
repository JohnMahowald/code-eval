def fibs num
  return 0 if num == 0
  return 1 if num == 1
  fibs(num - 1) + fibs(num - 2)
end

File.readlines(ARGV[0]).each do |line|
  puts fibs(line.chomp.to_i)
end

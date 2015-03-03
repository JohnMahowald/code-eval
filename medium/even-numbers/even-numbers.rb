def even_number num
  (num % 2 == 0) ? "1" : "0"
end

File.readlines(ARGV[0]).each do |line|
  puts even_number line.chomp[-1].to_i
end

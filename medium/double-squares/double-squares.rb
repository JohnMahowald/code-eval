def double_square num
end

File.readlines(ARGV[0]).each do |line|
  puts double_square line.chomp.to_i
end

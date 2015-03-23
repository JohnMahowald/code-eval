def lowest_unique arr
  unique_nums = arr.select { |num| arr.count(num) == 1 }

  if unique_nums.empty?
    0
  else
    arr.index(unique_nums.min) + 1
  end
end

File.open(ARGV[0]).each_line do |line|
  puts lowest_unique(line.chomp.split(" ").map(&:to_i))
end

def largest_sum arr
  result = 0

  arr.count.times do |i|
    ((i + 1)...arr.count).each do |j|
      sub_sum = arr[i..j].inject { |r, n| r + n }
      result = sub_sum if sub_sum > result
    end
  end

  result
end

File.readlines(ARGV[0]).each do |line|
  puts largest_sum line.chomp.split(",").map { |str_num| Integer str_num }
end

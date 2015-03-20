def reverse_groups arr, interval
  result = []
  sub = []
  i = 0

  while i < arr.length
    sub << arr[i]

    if ((i + 1) % interval) == 0 
      result.concat(sub.reverse)
      sub = []
    end
    
    i += 1
  end

  result.concat(sub)
end

File.open(ARGV[0]).each_line do |line|
  nums, interval = line.chomp.split(";")
  puts reverse_groups(nums.split(",").map(&:to_i), interval.to_i).join(",")
end

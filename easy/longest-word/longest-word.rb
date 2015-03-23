def longest_word arr
  shortest = 0
  idx = 0

  arr.each_with_index do |word, i|
    if word.length > shortest
      idx = i
      shortest = word.length
    end
  end

  arr[idx]
end

File.open(ARGV[0]).each_line do |line|
  puts longest_word line.chomp.split(" ")
end

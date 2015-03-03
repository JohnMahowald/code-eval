def detail_shifts str
  open = false
  current_shift = 0
  min_shift = str.length

  str.each_char do |char|
    case char
    when "X" then open = true
    when "." then current_shift += 1
    when "Y"
      if open
        min_shift = current_shift if current_shift < min_shift
      end
      open = false
      current_shift = 0
    when "," 
      open = false
      current_shift = 0
    end
  end

  min_shift
end

File.readlines(ARGV[0]).each do |line|
  puts detail_shifts line.chomp
end

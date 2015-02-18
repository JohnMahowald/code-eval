def smallest_multiple base, factor
  f = factor

  while base > f
    f *= 2
  end
  
  f
end

File.readlines(ARGV[0]).each do |line|
  base, factor = line.chomp.split(/,/).map(&:to_i)
  puts smallest_multiple(base, factor)
end

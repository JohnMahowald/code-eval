def mod base, factor
  if base == factor
    return 0
  elsif (base / factor) == 0
    return base
  else
    return mod((base - factor), factor)
  end
end

File.open(ARGV[0]).each_line do |line|
  puts mod(*line.chomp.split(",").map(&:to_i))
end

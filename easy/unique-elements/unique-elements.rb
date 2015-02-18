File.readlines(ARGV[0]).each do |line|
  puts line.chomp.split(/,/).uniq.join(",")
end

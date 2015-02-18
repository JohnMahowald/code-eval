def matching_index num, idx1, idx2
  bin = num.to_s(2)
  bin[-idx1] == bin[-idx2]
end

File.readlines(ARGV[0]).each do |line|
  num, idx1, idx2 = line.chomp.split(/,/).map(&:to_i)
  puts matching_index(num, idx1, idx2)
end

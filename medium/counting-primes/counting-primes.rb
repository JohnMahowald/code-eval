def count_primes s1, s2
  (s1..s2).count { |num| is_prime? num }
end

def is_prime? num
  return true if num < 3
  (2...num).each { |i| return false if (num % i) == 0 }
end

File.open(ARGV[0]).each_line do |line|
  puts count_primes *line.chomp.split(",").map(&:to_i)
end

def get_primes(num)
  result = []  
  i = 2
  while i < num
    result << i if is_prime?(i)
    i += 1
  end
  
  result
end

def is_prime?(num)
  (2...num).each { |i| return false if num % i == 0 }
  true
end

File.open(ARGV[0]).each_line do |line|
  puts get_primes(line.chomp.to_i).join(",")
end
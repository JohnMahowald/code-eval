def parse_nums(zero_string)
  digits = zero_string.split(" ")
  i = 0
  result = ""
  while i < digits.length
    if digits[i].length == 1
      result += digits[i + 1]
    else
      result += ("1" * digits[i + 1].length)
    end
    i += 2
  end
  result
end

def convert_binary(binary_str)
  binary_str.reverse!
  result = 0
  delta = 1
  binary_str.length.times do |i|
    result += delta * binary_str[i].to_i
    delta *= 2
  end
  result
end

File.open(ARGV[0]).each_line do |line|
  binary_num = parse_nums(line.chomp)
  puts convert_binary(binary_num)
end

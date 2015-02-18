def letter_ratio(str)
  lower = 0
  upper = 0
  str.each_char do |char|
    if char == char.upcase
      upper += 1
    else
      lower += 1
    end
  end
  "lowercase: #{rounded_avg(lower, str.length)} uppercase: #{rounded_avg(upper, str.length)}"
end

def rounded_avg(base, total)
  avg = ((base.to_f / total) * 100).round(2).to_s.split(".")
  "#{avg[0]}.#{padded_num(avg[1])}"
end

def padded_num(num_str)
  num_str.to_i < 10 ? "#{num_str}0" : num_str
end

File.open(ARGV[0]).each_line do |line|
  puts letter_ratio(line.chomp)
end

# ALPH = ("a".."f").to_a
#
# def dec_to_hex(str)
#   result = 0
#   delta = 1
#   str.reverse.each_char do |char|
#     char = char.downcase
#     if char =~ /[a-z]/
#       result += (ALPH.index(char) + 10)
#     else
#       result += (char.to_i * delta)
#     end
#     delta *= 16
#   end
#   result
# end

File.open(ARGV[0]).each_line do |line|
  puts line.chomp.to_i(16)
end.close
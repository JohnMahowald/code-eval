class CreditNum
  def self.strip_num(num_str)
    [].tap do |arr|
      num_str.each_char { |char| arr << char.to_i if char =~ /\w/ }
    end
  end

  def initialize(num_str)
    @num = CreditNum.strip_num(num_str)
  end

  def length
    @num.length
  end

  def valid_card_number?
    return false unless valid_length?
    return false unless valid_modulo?
    true
  end

  # private
  def valid_modulo?
    (add_digits % 10) == 0
  end

  def valid_length?
    (12..19).cover?(length)
  end

  def add_digits
    result = 0
    
    @num.reverse.each_with_index do |num, idx|
      result += (idx % 2 == 1 ? doubled_num(num) : num) 
    end

    result
  end

  def doubled_num(num)
    (num * 2) > 9 ? add_double_digits(num * 2) : num * 2
  end

  def add_double_digits(num)
    double_digits = (num % 10) + (num / 10)
  end
end

File.open(ARGV[0]).each_line do |line|
  num = CreditNum.new(line.chomp)
  puts num.valid_card_number? ? "1" : "0"
end

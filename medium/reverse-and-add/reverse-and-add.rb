class Iterator
  def initialize num
    @num = num
    @steps = 0
  end

  def make_palindrome
    until is_palindrome?
      step
    end

    puts "#{@steps} #{@num}"
  end

  private

  def step
    @steps += 1
    @num += reverse_num
  end

  def is_palindrome?
    reverse_num == @num
  end

  def reverse_num
    num = @num
    result = 0

    while num > 0
      result *= 10
      result += (num % 10)
      num /= 10
    end

    result
  end
end

File.readlines(ARGV[0]).each do |line|
  i = Iterator.new Integer line.chomp
  i.make_palindrome
end

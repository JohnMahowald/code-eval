class HappyNumber
  def initialize num
    @num = num
  end

  def happy?
    if is_reducable?
      1
    else
      0
    end
  end

  private

  def reduce num
    total = 0

    while num > 0
      remainder = (num % 10) ** 2
      total += remainder
      num /= 10
    end

    total
  end

  def is_reducable?
    seen  = [@num]

    until seen.last == 1
      last = reduce(seen.last)
      return false if seen.include? last
      seen << last
    end

    true
  end
end

File.readlines(ARGV[0]).each do |line|
  happy_number = HappyNumber.new(Integer line.chomp)
  puts happy_number.happy?
end

class VerbalSort
  attr_reader :lower_bound, :upper_bound, :instructions

  def initialize(upper_bound, instructions)
    @lower_bound = 0
    @upper_bound = upper_bound
    @instructions = instructions
  end

  def run_instructions
    while @instructions.count > 0
      next_move = @instructions.shift
      execute_move(next_move)
    end
  end

  private

  def execute_move(move)
    if move[0] =~ /Y/
      puts middle
    else
      adjust_bounds(move)
    end
  end

  def adjust_bounds(move)
    if move[0] =~ /L/
      lower
    else
      higher
    end
  end

  def lower
    @upper_bound = middle - 1
  end

  def higher
    @lower_bound = middle + 1
  end

  def middle
    (@upper_bound + @lower_bound + 1) / 2
  end
end

File.open(ARGV[0]).each_line do |line|
  instructions = line.chomp.split(" ")
  verbal_sort = VerbalSort.new(instructions[0].to_i, instructions[1..-1])
  verbal_sort.run_instructions
end

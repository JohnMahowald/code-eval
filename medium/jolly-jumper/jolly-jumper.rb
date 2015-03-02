class JollyJumper
  def initialize stack
    @stack = stack
  end

  def jolly_sequence
    if all_inclusive? 
      "Jolly"
    else
      "Not jolly"
    end
  end

  private

  def get_diff
    [].tap do |diff|
      (@stack.length - 1).times do |i|
        next if i == @stack.length
        diff << (@stack[i] - @stack[i + 1]).abs
      end
    end
  end

  def all_inclusive?
    (1...@stack.length).all? { |num| get_diff.include? num }
  end
end

File.readlines(ARGV[0]).each do |line|
  jj = JollyJumper.new line.chomp.split(" ").map(&:to_i).drop(1)
  puts jj.jolly_sequence
end

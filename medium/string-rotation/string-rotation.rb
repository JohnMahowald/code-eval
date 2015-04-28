class Rotation
  def initialize original, rotation
    @original, @rotation = original, rotation
  end

  def inspect
    rotation? ? "True" : "False"
  end

  def rotation?
    starts.any? { |idx| valid_rotation? idx }
  end

  def starts
    return @starts if @starts

    @starts = []

    @rotation.each_char.with_index do |char, i|
      @starts << i if char == @original[0]
    end

    @starts
  end

  private

  def valid_rotation? idx
    prefix = @rotation[idx...@rotation.length]
    postfix = @rotation[0...idx]
    @original == (prefix + postfix)
  end
end

File.open(ARGV[0]).each_line do |line|
  r = Rotation.new *line.chomp.split(",")
  puts r.inspect
end

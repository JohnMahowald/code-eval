class ShortestRepetition
  def initialize str
    @str = str
  end

  def unique
    unique_str = ""

    @str.each_char do |char|
      unique_str += char  unless unique_str.include? char
    end

    unique_str
  end

  def length
    @str.length
  end

  def inspect
    unique.length
  end
end

File.open(ARGV[0]).each_line do |line|
  sr = ShortestRepetition.new(line.chomp)
  puts sr.inspect
end

class Penultimate
  def initialize str
    @str = str
  end

  def matches
    /(\w+)\ \w+$/.match(@str)[1]
  end
end

File.open(ARGV[0]).each do |line|
  p = Penultimate.new(line.chomp)
  puts p.matches
end

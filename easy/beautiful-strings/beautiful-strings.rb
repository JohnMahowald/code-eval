class BeautifulString
  attr_reader :chars

  def initialize str
    @str = str
    @chars = BeautifulString.map_string(str)
  end

  def max_beauty
    return 0 unless @str

    result = 0
    i = 26
    keys = @chars.values.sort.reverse

    keys.each do |j|
      result += (i * j)
      i -= 1
    end

    result
  end

  private

  def self.map_string str
    map = {}

    str.each_char do |char|
      next unless char =~ /[a-zA-Z]/
      map[char.downcase] ||= 0
      map[char.downcase] += 1
    end

    map
  end
end

File.open(ARGV[0]).each do |line|
  bs = BeautifulString.new line.chomp
  puts bs.max_beauty
end

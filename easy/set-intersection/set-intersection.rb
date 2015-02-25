class List
  def initialize a, b
    @a, @b = a, b
  end

  def inspect
    if intersect.count > 0
      puts intersect.join(",")
    else
      puts
    end
  end
  
  private

  def intersect
    @a.select { |char| @b.include? char }
  end
end

File.readlines(ARGV[0]).each do |line|
  a, b = line.chomp.split(";").map { |arr| arr.split(",") }
  list = List.new a, b
  list.inspect
end

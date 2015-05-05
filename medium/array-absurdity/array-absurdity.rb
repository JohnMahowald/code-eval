class ArrayAbsurdity
  attr_reader :length

  def initialize length, array
    @length, @array = length, array
  end

  def sort
    @array.sort
  end

  def repeat
    arr = sort

    (length - 1).times do |i|
      return arr[i] if arr[i] == arr[i + 1]
    end

    return nil
  end

  def inspect
    repeat.to_s
  end
end

File.open(ARGV[0]).each_line do |line|
  length, arr = line.chomp.split(";")
  length = length.to_i
  arr = arr.split(",").map(&:to_i)

  aa = ArrayAbsurdity.new(length, arr)
  puts aa.inspect
end

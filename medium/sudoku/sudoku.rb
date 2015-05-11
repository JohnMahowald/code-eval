class SudokuBoard
  def self.build_board size, digits
    Array.new(size) { |arr| digits.shift(size) }
  end

  def initialize size, digits
    @size = size
    @board = SudokuBoard.build_board(size, digits)
    @result = (size + 1).times.inject(&:+)
  end

  def solved?
    valid_rows_and_cols && valid_grid
  end

  def inspect
    if solved?
      return "True"
    else
      return "False"
    end
  end

  private

  def [](a, b)
    @board[a][b]
  end

  def valid_rows_and_cols
    @size.times do |i|
      rows = 0
      cols = 0

      @size.times do |j|
        rows += self[i, j]
        cols += self[j, i]
      end

      return false unless (rows == @result) && (cols == @result)
    end

    true
  end
  
  def valid_grid
    grids.all? { |arr| arr.inject(&:+) == @result }
  end

  def grids
    grids = Array.new(@size)
    num_grids = Math.sqrt(@size).to_i

    @size.times do |i|
      row = (i / num_grids) * num_grids

      @size.times do |j|
        col = j / num_grids

        grid = row + col

        grids[grid] ||= []
        grids[grid] << self[i, j]
      end
    end

    grids
  end

  def valid_arr? arr
    arr.inject(&:+) == @result
  end
end

File.open(ARGV[0]).each_line do |line|
  size, digits = line.split(";")
  size = size.to_i
  digits = digits.split(",").map(&:to_i)

  b = SudokuBoard.new size, digits
  puts b.inspect
end


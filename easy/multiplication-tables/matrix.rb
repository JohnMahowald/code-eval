class Matrix
  def initialize(size)
    @size = size
  end

  def to_s
    @size.times do |i|
      @size.times do |j|
        print padded_mult(adjusted_mult(i, j))
      end
      puts
    end
  end

  private

  def adjusted_mult(i, j)
    (i + 1) * (j + 1)
  end

  def padded_mult num
    num_str = num.to_s
    padding = ""

    (4 - num_str.length).times do
      padding += " "
    end

    padding + num_str
  end
end

Matrix.new(12).to_s

class Angle
  def initialize(angle)
    @angle = angle.to_i
    @fraction = Angle.get_fraction(angle)
  end
  
  def to_angle
    "#{@angle}.#{padded_num(calc_min)}'#{padded_num(calc_sec)}\""    
  end
  
  private
  
  def padded_num(num)
    num < 10 ? "0#{num}" : "#{num}"
  end
  
  def calc_min
    raw_min.to_i
  end
  
  def calc_sec
    (Angle.get_fraction(raw_min) * 60).to_i
  end
  
  def raw_min
    @fraction * 60
  end
  
  def self.convert_fraction(fraction)
    ".#{fraction}".to_f
  end
  
  def self.get_fraction(num)
    Angle.convert_fraction(num.to_s.split(".")[1])
  end
end

File.open(ARGV[0]).each_line do |line|
  angle = Angle.new(line.chomp.to_f)
  puts angle.to_angle
end
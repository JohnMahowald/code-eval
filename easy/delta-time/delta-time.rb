class TimeDifference
  def initialize(t1, t2)
    @t1, @t2 = t1, t2
  end
  
  def to_s
    "#{padded_time(hrs)}:#{padded_time(min)}:#{padded_time(sec)}"
  end
  
  private
  
  def hrs
    hrs = calc_diff / 3600
  end
  
  def min
    min = (calc_diff - (hrs * 3600)) / 60
  end
  
  def sec
    (calc_diff - (hrs * 3600) - (min * 60)) % 60    
  end
  
  def padded_time(time)
    time < 10 ? "0#{time}" : "#{time}"
  end
  
  def calc_diff
    (@t2.total_seconds - @t1.total_seconds).abs
  end
end

class TimeStamp
  attr_accessor :hr, :min, :sec
  
  def initialize(time)
    @hr, @min, @sec = time.split(":").map(&:to_i)
  end
  
  def total_seconds
    hr_to_sec + min_to_sec + @sec
  end
  
  private
  
  def hr_to_sec
    @hr * 3600
  end
  
  def min_to_sec
    @min * 60
  end
end


File.open(ARGV[0]).each_line do |line|
  times = line.chomp.split(" ")
  t1 = TimeStamp.new(times.first)
  t2 = TimeStamp.new(times.last)
  difference = TimeDifference.new(t1, t2)
  puts difference.to_s
end
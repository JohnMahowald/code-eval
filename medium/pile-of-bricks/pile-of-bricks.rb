module BrickLayer
  HOLE_RE = /(\-*\d+)\,*(\-*\d+)/
  BRICK_RE = /(\-*\d+)\,*(\-*\d+)\,*(\-*\d+)/

  def self.parse_hole(cord)
    HOLE_RE.match(cord)[1..2].map(&:to_i)
  end
  
  def self.parse_bricks(cord)
    BRICK_RE.match(cord)[1..3].map(&:to_i)
  end
  
  def self.brick_fits?(brick, hole)
    brick.height <= hole.height && brick.width <= hole.width
  end
  
  class Hole
    def initialize(cords)
      @left, @right = Hole.parse_input(cords)
    end
    
    def height
      (@left[1] - @right[1]).abs
    end
    
    def width
      (@left[0] - @right[0]).abs
    end
  
    private
  
    def self.parse_input(cords)
      first, last = cords.split(" ")
      [BrickLayer.parse_hole(first), BrickLayer.parse_hole(last)]
    end
  end

  class Brick
    attr_accessor :idx 
    # [10,9,4], [9,4,2]
    def initialize(cords)
      @idx, @left, @right = Brick.parse_input(cords)
    end
    
    def height
      (@left[1] - @right[1]).abs
    end
    
    def width
      (@left[0] - @right[0]).abs
    end  
  
    private 
  
    def self.parse_input(cords)
      idx, left, right = cords.split(" ")
      [idx.to_i, BrickLayer.parse_bricks(left), BrickLayer.parse_bricks(right)]
    end
  end
end

File.open(ARGV[0]).each_line do |line|
  # parse raw data
  hole_data, brick_data = line.chomp.split("|")
  # create Hole object with data
  hole = BrickLayer::Hole.new(hole_data)
  # separate raw brick data
  bricks = brick_data.split(";").map { |data| data[1..-2] }
  # create Brick objects with raw data
  bricks
    .map! { |brick_data| BrickLayer::Brick.new(brick_data) }
    .collect! { |brick| brick.idx if BrickLayer.brick_fits?(brick, hole) }.compact!
  puts bricks.count > 0 ? bricks.join(",") : "-"
end
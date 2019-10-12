class Robot
  attr_accessor :position

  def initialize
    @position = Position.new
  end

  def report
    puts [@position.x, @position.y, @position.direction].join(', ')
  end

  def place(x, y, d)
    @position = Position.new(x: x, y: y, direction: d)
  end
end

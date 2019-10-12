class Table
  attr_accessor :robot

  def initialize(length:, width:)
    @length = length
    @width = width
  end

  def valid_position?
    return false if empty?

    @robot.position.x < @length &&
      @robot.position.y < @width &&
      @robot.position.x >= 0 &&
      @robot.position.y >= 0
  end

  def empty?
    @robot.nil?
  end
end

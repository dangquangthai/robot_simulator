class Position
  attr_reader :x, :y, :direction

  def initialize(x: 0, y: 0, direction: 'NORTH')
    define_helper_methods
    @x = x.to_i
    @y = y.to_i
    @direction = direction
  end

  def turn_left
    next_index = (DIRECTIONS.index(@direction) - 1) % 4
    @direction = DIRECTIONS[next_index]
  end

  def turn_right
    next_index = (DIRECTIONS.index(@direction) + 1) % 4
    @direction = DIRECTIONS[next_index]
  end

  def move
    @y += 1 if north?
    @y -= 1 if south?
    @x += 1 if east?
    @x -= 1 if west?
  end

  private

  DIRECTIONS = %w(NORTH EAST SOUTH WEST).freeze

  def define_helper_methods
    DIRECTIONS.each do |d|
      singleton_class.send(:define_method, "#{d.downcase}?") do
        d == @direction
      end
    end
  end
end

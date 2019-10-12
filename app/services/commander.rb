class Commander
  COMMANDS = %w(PLACE MOVE LEFT RIGHT REPORT).freeze

  def initialize(table:)
    @table = table
    @robot = table.robot
  end

  def execute(command)
    raise_error_if_table_empty!

    c, x, y, f = command.gsub(',', ' ').split
    raise execute_error(c) unless COMMANDS.include?(c)

    send(c.downcase, x, y, f)
  end

  private

  def place(*args)
    raise place_command_error unless args.compact.count == 3
    @robot.place(*args)
  end

  def report(*args)
    @robot.report
  end

  def left(*args)
    @robot.position.turn_left
  end

  def right(*args)
    @robot.position.turn_right
  end

  def move(*args)
    return unless @table.valid_position?
    @robot.position.move
  end

  def place_command_error
    ArgumentError.new('Required 3 arguments (x, y and direction)')
  end

  def execute_error(command)
    StandardError.new("Not found command #{command}")
  end

  def raise_error_if_table_empty!
    raise StandardError.new('Please place your robot on the table') if @table.empty?
  end
end

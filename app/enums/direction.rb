class Direction
  %w(NORTH EAST SOUTH WEST).each do |direction|
    self.class.send(:define_method, direction.downcase) do
      direction
    end
  end
end

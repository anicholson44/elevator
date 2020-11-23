class Elevator
  attr_reader :current_floor, :direction, :target_floors
  def initialize(floor:, direction: :idle, target_floors: [])
    @current_floor = floor
    @target_floors = target_floors
    @direction = direction
  end

  def distance(floor)
    case direction
    when :idle
      (floor - current_floor).abs
    when :up
      floor >= current_floor ? floor - current_floor : -1
    when :down
      floor <= current_floor ? current_floor - floor : -1
    end
  end

  def request(floor:, direction:)
  end
end

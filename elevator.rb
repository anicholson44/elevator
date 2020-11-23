class Elevator
  attr_reader :current_floor, :direction, :target_floor, :requests
  def initialize(floor: 1, direction: :idle, target_floor: nil)
    @current_floor = floor
    @target_floor = target_floor
    @direction = direction
    @requests = []
  end

  def distance(floor)
    case direction
    when :idle
      (floor - current_floor).abs
    when :up
      floor >= current_floor ? floor - current_floor : 
        target_floor - current_floor + target_floor - floor # if elevator has already passed floor, calculate the trip to and from the target floor
    when :down
      floor <= current_floor ? current_floor - floor :
        current_floor - target_floor + floor - target_floor # if elevator has already passed floor, calculate the trip to and from the target floor
    end
  end

  def request(elevator_request)
    insert_at = requests.find_index { |request| request.floor > elevator_request.floor }
    insert_at ? requests.insert(insert_at, elevator_request) : requests << elevator_request
    if direction == :idle
      @direction = current_floor > elevator_request.floor ? :down : :up
    end
  end

  def time_passed
    next_floor
    check_direction
  end

  private def next_floor
    case direction
    when :up
      @current_floor = current_floor + 1
    when :down
      @current_floor = current_floor - 1
    end
  end

  private def check_direction
    if current_floor == target_floor
      @direction = :idle
    end
  end
end

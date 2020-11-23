require './sorted_array'

class Elevator
  attr_reader :current_floor, :direction, :requests, :floor_requests
  def initialize(floor: 1, direction: :idle)
    @current_floor = floor
    @direction = direction
    @requests = SortedArray.new(-> (element, request) { element.floor > request.floor })
    @floor_requests = SortedArray.new(-> (element, request) { element > request })
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
    requests.insert(elevator_request)
    if direction == :idle
      @direction = current_floor > elevator_request.floor ? :down : :up
    end
  end

  def floor_request(floor)
    floor_requests.insert(floor)
  end

  def time_passed
    next_floor
    check_direction
    check_floor
  end

  # Try to derive target_floor state rather than store it separately.
  # This is probably wrong as I am running out of time. Building a solution
  # with the concept of a target floor might have been a mistake, anyway.
  private def target_floor
    case direction
    when :up
      (floor_requests + requests.map(&:floor)).max
    when :down
      (floor_requests + requests.map(&:floor)).min
    end
  end

  private def next_floor
    case direction
    when :up
      @current_floor = current_floor + 1
    when :down
      @current_floor = current_floor - 1
    end
  end

  private def check_floor
    request = requests.find { |r| r.floor == current_floor }
    if request
      puts "Passenger(s) picked up from floor #{current_floor}"
      @direction = request.direction
    end
    floor_requests.select { |r| r == current_floor }.each do
      puts "Passenger(s) dropped off on floor #{current_floor}"
    end
  end

  private def check_direction
    if current_floor == target_floor
      @direction = :idle
    end
  end
end

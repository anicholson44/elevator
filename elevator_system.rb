require './elevator'
require './elevator_request'

class ElevatorSystem
  attr_reader :elevators, :floors
  def initialize(elevators:, floors:)
    @elevators = elevators.times.map { Elevator.new(floor: 1) }
    @floors = floors
  end

  def elevator_request(floor:, direction:)
    closest_elevator = elevators.reduce do |closest, current|
      distance = current.distance(floor)
      distance > -1 && distance < closest.distance(floor) ? current : closest
    end
    closest_elevator.request(ElevatorRequest.new(floor: floor))
  end

  def time_passed
    # TODO: implement
  end

  def floor_request(floor)
    # TODO: implement
  end
end

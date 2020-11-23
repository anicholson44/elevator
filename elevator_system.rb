class ElevatorSystem
  attr_reader :elevators, :floors
  def initialize(elevators:, floors:)
    @elevators = elevators
    @floors = floors
  end

  def elevator_request(floor:, direction:)
    # TODO: implement
  end

  def time_passed
    # TODO: implement
  end

  def floor_request(floor)
    # TODO: implement
  end
end

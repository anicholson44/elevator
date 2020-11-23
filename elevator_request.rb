class ElevatorRequest
  attr_reader :floor
  def initialize(floor:)
    @floor = floor
  end
end

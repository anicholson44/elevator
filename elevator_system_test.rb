require 'minitest/autorun'
require './elevator_system'

class ElevatorSystemTest < Minitest::Test
  def test_elevator_system
    elevator_system = ElevatorSystem.new(elevators: 3, floors: 10)
    elevator_system.elevator_request(floor: 1, direction: :up)
    elevator_1 = elevator_system.elevators[0]
    assert_equal [1], elevator_1.requests.map(&:floor)
    elevator_system.time_passed
    elevator_system.time_passed
    elevator_system.time_passed
    # "Passenger(s) picked up from floor 1"
    elevator_system.floor_request(7)
    elevator_system.floor_request(9)
    elevator_system.time_passed
    elevator_system.time_passed
    elevator_system.time_passed
    elevator_system.time_passed
    # "Passenger(s) dropped off on floor 7"
    elevator_system.time_passed
    # "Passenger(s) dropped off on floor 9"
  end
end

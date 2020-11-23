require 'minitest/autorun'
require 'byebug'
require './elevator'
require './elevator_request'

class ElevatorTest < Minitest::Test
  def test_distance
    floor = 5
    idle_elevator = Elevator.new(floor: 1)
    assert_equal 4, idle_elevator.distance(floor)

    up_elevator_1 = Elevator.new(floor: 1, direction: :up)
    assert_equal 4, up_elevator_1.distance(floor)
    up_elevator_2 = Elevator.new(floor: 6, direction: :up, target_floor: 10)
    assert_equal 9, up_elevator_2.distance(floor)
    up_elevator_3 = Elevator.new(floor: 5, direction: :up)
    assert_equal 0, up_elevator_3.distance(floor)

    down_elevator_1 = Elevator.new(floor: 1, direction: :down, target_floor: 1)
    assert_equal 4, down_elevator_1.distance(floor)
    down_elevator_2 = Elevator.new(floor: 6, direction: :down)
    assert_equal 1, down_elevator_2.distance(floor)
    down_elevator_3 = Elevator.new(floor: 5, direction: :down)
    assert_equal 0, down_elevator_3.distance(floor)
  end

  def test_request
    elevator = Elevator.new
    request_1 = ElevatorRequest.new(floor: 1)
    elevator.request(request_1)
    assert_equal [request_1], elevator.requests

    request_2 = ElevatorRequest.new(floor: 3)
    elevator.request(request_2)
    assert_equal [request_1, request_2], elevator.requests

    request_3 = ElevatorRequest.new(floor: 2)
    elevator.request(request_3)
    assert_equal [request_1, request_3, request_2], elevator.requests
  end
end

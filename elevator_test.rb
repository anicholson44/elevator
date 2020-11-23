require 'minitest/autorun'
require './elevator'
require 'byebug'

class ElevatorTest < Minitest::Test
  def test_distance
    floor = 5
    idle_elevator = Elevator.new(floor: 1)
    assert_equal 4, idle_elevator.distance(floor)

    up_elevator_1 = Elevator.new(floor: 1, direction: :up)
    assert_equal 4, up_elevator_1.distance(floor)
    up_elevator_2 = Elevator.new(floor: 6, direction: :up)
    assert_equal -1, up_elevator_2.distance(floor)
    up_elevator_3 = Elevator.new(floor: 5, direction: :up)
    assert_equal 0, up_elevator_3.distance(floor)

    down_elevator_1 = Elevator.new(floor: 1, direction: :down)
    assert_equal -1, down_elevator_1.distance(floor)
    down_elevator_2 = Elevator.new(floor: 6, direction: :down)
    assert_equal 1, down_elevator_2.distance(floor)
    down_elevator_3 = Elevator.new(floor: 5, direction: :down)
    assert_equal 0, down_elevator_3.distance(floor)
  end
end

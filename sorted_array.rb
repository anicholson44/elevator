require 'delegate'

class SortedArray < Delegator
  attr_accessor :array
  alias_method :__getobj__, :array

  def initialize(compare, array = [])
    @array = array
    @compare = compare
  end

  def insert(el)
    insert_at = array.find_index { |e| @compare.call(e, el) }
    insert_at ? array.insert(insert_at, el) : array << el
  end
end

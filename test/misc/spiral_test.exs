defmodule Misc.SpiralTest do
  use ExUnit.Case
  doctest Misc.Spiral
  
  alias Misc.Spiral

  @rectangle [
    [1000, 1001, 1002, 1003],
    [1004, 1005, 1006, 1007],
    [1008, 1009, 1010, 1011]
  ]

  @horizontal [ [1, 2, 3, 4] ]
  
  @vertical [
    [1],
    [2],
    [3],
    [4]
  ]
  
  test "clockwise" do
    assert Spiral.clockwise(@rectangle) == [1000, 1001, 1002, 1003, 1007, 1011, 1010, 1009, 1008, 1004, 1005, 1006]
  end
  
  test "counterclockwise" do
    assert Spiral.counterclockwise(@rectangle) == [1000, 1004, 1008, 1009, 1010, 1011, 1007, 1003, 1002, 1001, 1005, 1006]
  end

  ###
  test "horizonal clockwise" do
    assert Spiral.clockwise(@horizontal) == [1, 2, 3, 4]
  end

  test "horizonal counterclockwise" do
    assert Spiral.counterclockwise(@horizontal) == [1, 2, 3, 4]
  end

  ###
  test "vertical clockwise" do
    assert Spiral.clockwise(@vertical) == [1, 2, 3, 4]
  end

  test "vertical counterclockwise" do
    assert Spiral.counterclockwise(@vertical) == [1, 2, 3, 4]
  end
  
  ###
  test "empty" do
    assert Spiral.clockwise([]) == []
    assert Spiral.counterclockwise([]) == []
  end
  
end


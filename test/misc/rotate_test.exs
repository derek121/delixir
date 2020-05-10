defmodule Misc.RotateTest do
  use ExUnit.Case
  doctest Misc.Rotate

  alias Misc.Rotate

  @rectangle [
    [10, 11, 12, 13],
    [14, 15, 16, 17],
    [18, 19, 20, 21]
  ]

  @horizontal [ [1, 2, 3, 4] ]
  
  @vertical [
    [1],
    [2],
    [3],
    [4]
  ]

  ###
  test "rectangle twice" do
    expected = [
      [21, 20, 19, 18],
      [17, 16, 15, 14],
      [13, 12, 11, 10]
    ]
    assert Rotate.twice(@rectangle) == expected
  end

  test "rectangle clockwise" do
    expected = [
      [18, 14, 10],
      [19, 15, 11],
      [20, 16, 12],
      [21, 17, 13]
    ]
    assert Rotate.clockwise(@rectangle) == expected
  end

  test "rectangle counterclockwise" do
    expected = [
      [13, 17, 21],
      [12, 16, 20],
      [11, 15, 19],
      [10, 14, 18]
    ]
    assert Rotate.counterclockwise(@rectangle) == expected
  end

  ###
  test "horizontal twice" do
    expected = [ [4, 3, 2, 1] ]
    assert Rotate.twice(@horizontal) == expected
  end

  test "horizontal clockwise" do
    expected = [
      [1],
      [2],
      [3],
      [4]
    ]
    assert Rotate.clockwise(@horizontal) == expected
  end

  test "horizontal counterclockwise" do
    expected = [
      [4],
      [3],
      [2],
      [1]
    ]
    assert Rotate.counterclockwise(@horizontal) == expected
  end

  ###
  test "vertical clockwise" do
    expected = [ [4, 3, 2, 1] ]
    assert Rotate.clockwise(@vertical) == expected
  end

  test "vertical counterclockwise" do
    expected = [ [1, 2, 3, 4] ]
    assert Rotate.counterclockwise(@vertical) == expected
  end

  ###
  test "empty" do
    rect = []
    assert Rotate.twice(rect) == []
    assert Rotate.clockwise(rect) == []
    assert Rotate.counterclockwise(rect) == []
  end
  
end


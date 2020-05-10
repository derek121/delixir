defmodule Misc.Rotate do
  @moduledoc """
  Rotate matrix once in either direction, or twice.
  
  For example:
  ```
  iex(1)> rect = [
  ...(1)> [1000, 1001, 1002, 1003],
  ...(1)> [1004, 1005, 1006, 1007],
  ...(1)> [1008, 1009, 1010, 1011]
  ...(1)> ]
  [[1000, 1001, 1002, 1003], [1004, 1005, 1006, 1007], [1008, 1009, 1010, 1011]]
  iex(2)> Misc.Spiral.clockwise(rect)
  [1000, 1001, 1002, 1003, 1007, 1011, 1010, 1009, 1008, 1004, 1005, 1006]
  iex(3)> 
  ```
  """

  def twice(rect) do
    Enum.reverse(rect)
    |> Enum.map(&Enum.reverse/1)
  end

  def clockwise(rect) do
    Enum.reverse(rect)
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def counterclockwise(rect) do
    Enum.map(rect, &Enum.reverse/1)
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  ###
  def out(r), do: Enum.each(r, &(:io.format('~w~n', [&1])))
end


defmodule Misc.Spiral do
  @moduledoc """
    Starting from the top left of a rectangle (list of lists / two-dimensional
    array), move in a tightening spiral either clockwise or counterclockwise, 
    producing the resulting list.
    
    For example:
    ```
    iex(1)> rect = [
    ...(1)>   [1000, 1001, 1002, 1003],
    ...(1)>   [1004, 1005, 1006, 1007],
    ...(1)>   [1008, 1009, 1010, 1011]
    ...(1)> ]
    [[1000, 1001, 1002, 1003], [1004, 1005, 1006, 1007], [1008, 1009, 1010, 1011]]
    iex(2)> Misc.Spiral.clockwise(rect)       
    [1000, 1001, 1002, 1003, 1007, 1011, 1010, 1009, 1008, 1004, 1005, 1006]
    iex(3)>
    iex(4)> Misc.Spiral.counterclockwise(rect)         
    [1000, 1004, 1008, 1009, 1010, 1011, 1007, 1003, 1002, 1001, 1005, 1006]
    ```
  """
  
  alias Misc.Munge
  alias Misc.Rotate

  def clockwise(rect) do
    Munge.munge(rect, [], nil, &process_clockwise/2)
  end

  def counterclockwise(rect) do
    Munge.munge(rect, [], nil, &process_counterclockwise/2)
  end

  ###
  defp process_clockwise([], acc) do
    {nil, List.flatten(Enum.reverse(acc))}
  end

  defp process_clockwise([h | t], acc) do
    rotated = Rotate.counterclockwise(t)
    {rotated, [h | acc]}
  end

  ###
  defp process_counterclockwise([], acc) do
    {nil, List.flatten(Enum.reverse(acc))}
  end

  defp process_counterclockwise(rect, acc) do
    [h | t] = Rotate.clockwise(rect)
    {t, [Enum.reverse(h) | acc]}
  end

  ###
  def demo() do
    do_demo([
      [10, 11, 12],
      [13, 14, 15],
      [16, 17, 18]
    ])
    IO.puts("")

    do_demo([
      [10, 11, 12, 13],
      [14, 15, 16, 17],
      [18, 19, 20, 21]
    ])
    IO.puts("")

    do_demo([
      [10, 11, 12],
      [13, 14, 15],
      [16, 17, 18],
      [19, 20, 21],
    ])
    IO.puts("")

    do_demo([
      [1, 2, 3]
    ])
    IO.puts("")

    do_demo([
      [1],
      [2],
      [3]
    ])
    IO.puts("")

    do_demo([
      [1]
    ])

  end

  defp do_demo(rect) do
    IO.puts("Original")
    Rotate.out(rect)

    ret = Misc.Spiral.clockwise(rect)
    IO.puts("Spiral Clockwise")
    :io.format('~w~n', [ret])

    ret = Misc.Spiral.counterclockwise(rect)
    IO.puts("Spiral Counterclockwise")
    :io.format('~w~n', [ret])
  end
end

###

#Misc.Spiral.demo()


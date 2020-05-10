defmodule Misc.Munge do
  @moduledoc """
  Similar to a fold, but instead of passing each element of a list/enumerable
  in turn along with an accumulator to the given function, start with `val`
  and accumulator `acc`, repeatedly passing the returned val and accumulator
  to the function until the stop value is returned.
  
  For example:
  ```
  iex(54)> Misc.Munge.munge(1, 0, :stop, fn(val, acc) ->
  ...(54)>   if val < 6, do: {val + 2, acc + val}, else: {:stop, acc}
  ...(54)> end)
  9
  ```
  """

  def munge(val, acc, stop \\ nil, fun)
  def munge(stop, acc, stop, _fun), do: acc
  def munge(val, acc, stop, fun) do
    {new_val, new_acc} = fun.(val, acc)
    munge(new_val, new_acc, stop, fun)
  end

end


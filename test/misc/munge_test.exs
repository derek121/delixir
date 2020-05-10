defmodule Misc.MungeTest do
  use ExUnit.Case
  doctest Misc.Munge

  alias Misc.Munge

  test "munge" do
    ret = Munge.munge(1, 0, :stop, fn(val, acc) ->
      if val < 6, do: {val + 2, acc + val}, else: {:stop, acc}
    end)
    assert ret == 9
  end

  test "munge with default stop" do
    ret = Munge.munge(1, 0, fn(val, acc) ->
      if val < 6, do: {val + 2, acc + val}, else: {nil, acc}
    end)
    assert ret == 9
  end
  
end


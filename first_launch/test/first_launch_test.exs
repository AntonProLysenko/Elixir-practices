defmodule FirstLaunchTest do
  use ExUnit.Case
  doctest FirstLaunch

  test "greets the world" do
    assert FirstLaunch.hello() == :world
  end
end

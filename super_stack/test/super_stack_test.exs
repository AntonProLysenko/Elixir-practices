defmodule SuperStackTest do
  use ExUnit.Case
  doctest SuperStack

  test "greets the world" do
    assert SuperStack.hello() == :world
  end
end

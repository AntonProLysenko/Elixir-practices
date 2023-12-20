ExUnit.start(auto_run: false)
defmodule StackTest do
  alias ExUnit.DocTest.Error
  use ExUnit.Case

  # doctest Stack

  # test "inits the Stack pushes and poping element in it" do
  #   # assert Stack.hello() == :world
  #   {:ok, pid} = Stack.create([])
  #   assert Stack.pop(pid) == nil
  #   assert Stack.read(pid) == []
  #   Stack.push(pid, 10)
  #   Stack.push(pid, [])
  #   assert Stack.read(pid) == [[], 10]
  #   assert Stack.pop(pid) == []
  #   assert Stack.read(pid) == [10]
  #   Stack.push(pid)
  #   assert Stack.read(pid) == [nil, 10]
  # end

  test "inits emty Stack and removes element from empty stack and ads elem to empty stack"do
    {:ok, pid} = Stack.start_link()
    assert Stack.read(pid) == []
    assert_raise ArgumentError,"Nothing to pop, Empty Stack ", fn -> Stack.pop(pid) end
    # assert Stack.pop(pid) == nil
  #   assert Stack.read(pid) == []
  #  Stack.push(pid, 145)
  #  assert Stack.read(pid) == [145]
  end

  test "converts list to a stack and removes one element from the stack and ads elem to stack" do
    {:ok, pid} = Stack.start_link([1,2,3])
    assert Stack.read(pid) == [1,2,3]
    assert Stack.pop(pid) == 1
    assert Stack.read(pid) == [2,3]
    Stack.push(pid, 145)
    assert Stack.read(pid) == [145,2,3]
  end

  test"Removing from the list multiple elements" do
    {:ok, pid} = Stack.start_link([1,2,3])
    assert Stack.pop(pid, [2,3]) == [2,3]
    assert Stack.read(pid) == [1]
  end


end
ExUnit.run()

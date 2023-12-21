defmodule Stack do
  @moduledoc """
  Documentation for `Stack`.
  """
  use GenServer



  @spec start_link(list()) :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link(config\\[]) do
    GenServer.start_link(__MODULE__, config)
  end

  def pop(pid) do
    GenServer.call(pid, :pop, :infinity)
  end

  def pop(pid, elems) do
    GenServer.call(pid, {:pop, elems})
  end

  def push(pid, elem\\nil) do
    IO.inspect(elem)
    GenServer.cast(pid, {:push, elem})
  end

  def read(pid) do
    GenServer.call(pid, :read)
  end




#########  SERVER  #########################################
  @impl true
  @spec init(list()) :: {:ok, list()}
  def init(state\\[]) do
    {:ok, state}
  end

  @impl true
  def handle_call(:pop, _caller, state)do
    {poped, list} =
      if length(state)>0 do
        List.pop_at(state, 0)
      else
        # {nil, []}
        raise(ArgumentError, "Nothing to pop, Empty Stack ")
      end
    {:reply, poped, list}
  end

  @impl true
  def handle_call({:pop, elems}, _caller, state)do
    {poped, list} =
      if length(state)>0 do
        { Enum.filter(state, fn elem ->
            elem in elems
          end),

          Enum.filter(state, fn elem ->
            !(elem in elems)
          end)
        }

      else
        {nil, []}
      end
    {:reply, poped, list}
  end



  @impl true
  def handle_call(:read, _caller, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:push, elem}, state)do
    {:noreply, [elem | state]}
  end



end

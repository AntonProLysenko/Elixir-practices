defmodule SuperStack do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

   def push(elem) do
    GenServer.call(__MODULE__, {:push, elem})
  end

  def pop() do
    GenServer.call(__MODULE__, :pop)
  end

  def check() do
    GenServer.call(__MODULE__, :read)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:pop, _from, state) do
    [head | tail] = state
    {:reply, head, tail}
  end

  @impl true
  def handle_call({:push, element}, _from, state) do
    new_state = [element | state]
    {:reply, new_state, new_state}
  end

  @impl true
  def handle_call(:read, _from, state) do
    {:reply, state, state}
  end
end

# defmodule SupervisedStack do
#   # use Supervisor
#   use GenServer

#   def start_link(opts\\[]) do
#     GenServer.start_link(__MODULE__, opts, name: __MODULE__)
#   end

#   def push(pid, elem) do
#     GenServer.call(pid, {:push, elem})
#   end

#   def pop(pid) do
#     GenServer.call(pid, :pop)
#   end

#   def check(pid) do
#     GenServer.call(pid, :read)
#   end





#   @impl true
#   def init(state) do
#     {:ok, state}
#   end

#   @impl true
#   def handle_call({:push, elem}, _from, state) do

#     new_state = state++[elem]
#     {:reply, new_state, new_state}
#   end

#   @impl true
#   def handle_call(:pop, _from, state) do
#     [head | tail] = state
#     {:reply, head, tail}
#   end

#     def handle_call(:read, _from, state) do
#     {:reply, state, state}
#   end
# end


# child=[
#   %{
#     id: :one,
#     start: {SupervisedStack, :start_link, []}
#   }
#   # {SupervisedStack, []}
# ]

# # {:ok, pid} = SupervisedStack.start_link()
# # {:ok, super_pid} =  Supervisor.start_link(child, strategy: :one_for_one, max_restarts: 5)












defmodule Stack do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

   def push(pid, elem) do
    GenServer.call(pid, {:push, elem})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def check(pid) do
    GenServer.call(pid, :read)
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

{:ok, pid} = GenServer.start_link(Stack, [])

children = [
  {Stack, []}
]

{:ok, supervisor_pid} = Supervisor.start_link(children, strategy: :one_for_one)



Stack.check(pid)
Stack.push(pid, 2)
Stack.pop(pid)
Stack.check(pid)
# Stack.pop(pid)

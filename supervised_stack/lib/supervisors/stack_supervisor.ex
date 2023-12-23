defmodule Stack.Application do
    use Application
    @impl true
    def start(_start_type, _start_args) do
      children = [
        {Stack, []}
      ]

      opts = [strategy: :one_for_one, name: Stack.Supervisor]
      Supervisor.start_link(children, opts)
    end

  end

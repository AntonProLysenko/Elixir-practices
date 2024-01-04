defmodule CounterWeb.CounterController do
  use CounterWeb, :controller

  def count(conn, params) do
    # The home page is often custom made,
    # so skip the default app layout.
    IO.inspect(params, label: "PARAMS")

    render(conn, :count,
     count: if params["count"] do
       String.to_integer(params["count"])
       else 0
      end)
  end

  def increment(conn, params) do
    current_count = String.to_integer(params["count"])
    increment_by = String.to_integer(params["increment_by"])
    IO.inspect(params, label: "INC PARS")
    render(conn, :count, count: current_count + increment_by)
end
end

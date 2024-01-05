defmodule PhoenixDrillWeb.HelloController do
  use PhoenixDrillWeb, :controller

  def hello(conn, _params) do
    render(conn, :hello, layout: false)
  end

end


defmodule PhoenixDrillWeb.RandomNumController do
  use PhoenixDrillWeb, :controller

  def random_number(conn, _params) do
    render(conn, :random_num, random_num: Enum.random(1..100))
  end

end

defmodule PhoenixDrillWeb.NavBarController do
  use PhoenixDrillWeb, :controller

  def home(conn, _params)do
    render(conn, :home, layout: false)
  end

  def about(conn, _params)do
    render(conn, :about,  layout: false)
  end

  def projects(conn, _params)do
    render(conn, :projects,  layout: false)
  end

end



defmodule PhoenixDrillWeb.CounterController do
  use PhoenixDrillWeb, :controller
  def count(conn, params)do
    IO.inspect(params, label: "HERE!!!!")
       render(conn, :counter, counter: if(params["counter"], do: String.to_integer(params["counter"]), else: 0), layout: false)
  end

end

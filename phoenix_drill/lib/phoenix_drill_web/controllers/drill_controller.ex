defmodule PhoenixDrillWeb.HelloController do
  use PhoenixDrillWeb, :controller

  def hello(conn, _params) do
    render(conn, :hello, layout: false)
  end

end


defmodule PhoenixDrillWeb.RandomNumController do
  use PhoenixDrillWeb, :controller

  def random_number(conn, _params) do
    render(conn, :random_num, random_num: Enum.random(1..100), layout: false)
  end

end

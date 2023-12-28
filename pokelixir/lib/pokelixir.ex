defmodule Pokelixir do
  # use Finch
  # use Jason


  @moduledoc """
  Documentation for `Pokelixir`.
  """
  @defstruct [:id, :name, :hp, :attack, :deffence, :special_attack, :special_defense, :speed, :height, :weight, :types]
  @doc """
  Hello world.

  ## Examples

      iex> Pokelixir.hello()
      :world

  """

  def get(this, name) do
    children = [
  {Finch, name: MyFinch}
]
    Finch.start_link(name: MyFinch)
  end
end

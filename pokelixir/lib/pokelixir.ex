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

  def get(name) do
    Finch.start_link(name: SinglePokeFinch)
    req = Finch.build(:get, "https://pokeapi.co/api/v2/pokemon/#{String.downcase(name)}")
    Finch.request!(req, SinglePokeFinch)
  end
end

defmodule Pokelixir do
  # use Finch
  # use Jason


  @moduledoc """
  Documentation for `Pokelixir`.
  """
  defstruct [:id, :name, :hp, :attack, :defense, :special_attack, :special_defense, :speed, :height, :weight, :types]
  @doc """
  Hello world.

  ## Examples

      iex> Pokelixir.hello()
      :world

  """

  def getPokemon(name) do
    Task.async(fn ->
      Finch.start_link(name: SinglePokeFinch)
      req = Finch.build(:get, "https://pokeapi.co/api/v2/pokemon/#{String.downcase(name)}")
      res = Finch.request!(req, SinglePokeFinch)

      if res.status == 200 do
        Jason.decode!(res.body)
      else
        "#{res.status} #{res.body}"
      end
    end)
  end

  def getMultiplePokemons()do
    Task.async(fn ->
      Finch.start_link(name: MultiplePokeFinch)
      req = Finch.build(:get, "https://pokeapi.co/api/v2/pokemon/")
      res = Finch.request!(req, MultiplePokeFinch)

      if res.status == 200 do
        decoded = Jason.decode!(res.body)
        decoded["results"]
      else
        "#{res.status} #{res.body}"
      end

    end)
  end

  def choseAnyFromAvailable() do
    # fetched_pokemons =
     IO.puts("Here all available Pokemons to choise:\n")
    names = Enum.map(Task.await(getMultiplePokemons()), fn pokemon->
      IO.puts("#{pokemon["name"]}")
    end)

    #{names}")

  end

  def createPokemon(name) do
    fetched_pokemon = Task.await(getPokemon(name))

    IO.inspect(fetched_pokemon)
    %Pokelixir{
      id: fetched_pokemon["id"],
      name: fetched_pokemon["name"],
      # hp: fetched_pokemon.stats[0],
      hp: Enum.at(fetched_pokemon["stats"],0)["base_stat"],
      attack: Enum.at(fetched_pokemon["stats"],1)["base_stat"],
      defense: Enum.at(fetched_pokemon["stats"],2)["base_stat"],
      special_attack: Enum.at(fetched_pokemon["stats"],3)["base_stat"],
      special_defense: Enum.at(fetched_pokemon["stats"],4)["base_stat"],
      speed: Enum.at(fetched_pokemon["stats"],5)["base_stat"],
      height: fetched_pokemon["height"],
      weight: fetched_pokemon["weight"],
      types:
      Enum.map(fetched_pokemon["types"], fn each ->
        each["type"]["name"]
      end)

    }


  end



end

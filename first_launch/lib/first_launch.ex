defmodule Measurements do
  @doc """
  Given a list of measurements as integers, determine the increment between each integer.

  ## Examples

    iex> Measurements.increments([100, 150, 120, 130])
    [50, -30, 10]

    iex> Measurements.increments([10, 20, 10, 40])
    [10, -10, 30]
  """
  def increments(measurements) do
    measurements
    |>Enum.chunk_every(2, 1, :discard)
    |>Enum.map(fn el -> Enum.at(el,1)-Enum.at(el,0) end)

    #  Enum.map(Enum.chunk_every(measurements,2, 1, :discard), fn el -> Enum.at(el,1) - Enum.at(el,0) end)
  end

  @doc """
  Given a list of measurements as integers, determine how many have increased.
  Each positive change since the previous integer in the list should count as an increase.

  ## Examples

    iex> Measurements.increased([1, 1, 2, 3, 1])
    2

    iex> Measurements.increased([1, 2, 1])
    1

    iex> Measurements.increased([3, 1, 2])
    1
  """
  def increased(measurements) do
    filtered = Enum.filter(increments(measurements), fn el -> el > 0 end)
    length(filtered)
  end

  @doc """
  Given a list of measurements as integers, sum the amount they have increased by.
  Only positive increments are taken into account.

  ## Examples

    iex> Measurements.increased_by([100, 150, 120, 130])
    60

    iex> Measurements.increased_by([10, 20, 10, 40])
    40
  """
  def increased_by(measurements) do
    measurements
    # Enum.map(measurements, fn el ->
    #   diff = 0
    # end)
  end

  @doc """
  Find the average of a list of numbers.
  You can calculate average as sum of integers / length of list.

  ## Examples

    iex> Measurements.average([4, 5, 6])
    5.0

    iex> Measurements.average([2, 10])
    6.0
  """
  def average(measurements) do
    Enum.sum(measurements) / Enum.count(measurements)
  end
end

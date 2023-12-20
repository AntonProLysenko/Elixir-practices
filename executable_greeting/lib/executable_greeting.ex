defmodule ExecutableGreeting do
  @moduledoc """
  Documentation for `ExecutableGreeting`.
  """

  @doc """
  Hello world.

  ## Examples
  """
  def main(args) do
    {opts, _word, _errors} = OptionParser.parse(args, switches: [time: :string, upcase: :boolean])
    daytime = "Good #{opts[:time] || "Morning"}!"
      if opts[:upcase] do
       IO.puts(String.upcase(daytime))
      else
        IO.puts(daytime)
      end



  end
end

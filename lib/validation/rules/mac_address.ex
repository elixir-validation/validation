defmodule Validation.Rules.MacAddress do

  @doc """
  Validates whether the input is a valid MAC address.
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^(([0-9a-fA-F]{2}-){5}|([0-9a-fA-F]{2}:){5})[0-9a-fA-F]{2}$/)

    if regex_validation do
      {:ok}
    else
      {:error, "Invalid Mac Address."}
    end
  end
end

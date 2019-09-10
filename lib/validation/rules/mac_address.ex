defmodule Validation.Rules.MacAddress do

  @doc """
  Validates whether the input is a valid MAC address.

      # {:ok}
      V.mac_address("00:11:22:33:44:55")
      V.mac_address("66-77-88-99-aa-bb")
      V.mac_address("AF:0F:bd:12:44:ba")

      # {:error, message}
      V.mac_address("")
      V.mac_address("00-1122:33:44:55")
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

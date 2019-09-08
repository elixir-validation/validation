defmodule Validation do
  @type default :: {:ok} | {:error, String.t}

  @moduledoc """
  Documentation for Validation.
  """

  @doc """
  Validates whether the input is a valid MAC address.
  """
  @spec mac_address(String.t) :: default
  def mac_address(input) when is_binary(input) do
    Validation.MacAddress.validate(input)
  end
end

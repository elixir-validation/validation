defmodule Validation.Rules.MacAddress do
  @moduledoc false

  @spec validate(String.t) :: boolean
  def validate(input) when is_binary(input) do
    String.match?(input, ~r/^(([0-9a-fA-F]{2}-){5}|([0-9a-fA-F]{2}:){5})[0-9a-fA-F]{2}$/)
  end
end

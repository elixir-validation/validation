defmodule Validation.Rules.Lowercase do
  @moduledoc false

  @spec validate(String.t) :: boolean
  def validate(input) when is_binary(input) do
    input_lowercase = String.downcase(input)

    input == input_lowercase
  end
end

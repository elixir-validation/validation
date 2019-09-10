defmodule Validation.Rules.Lowercase do
  @moduledoc false

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    input_lowercase = String.downcase(input)

    if input == input_lowercase do
      {:ok}
    else
      {:error, "Invalid lowercase value."}
    end
  end
end

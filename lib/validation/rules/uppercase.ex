defmodule Validation.Rules.Uppercase do

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    input_uppercase = String.upcase(input)

    if input == input_uppercase do
      {:ok}
    else
      {:error, "Invalid uppercase value."}
    end
  end
end

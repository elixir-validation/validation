defmodule Validation.Rules.Uppercase do

  @doc """
  Validates whether the input is uppercase.

      # {:ok}
      V.uppercase("")
      V.uppercase("UPPERCASE")
      V.uppercase("UPPERCASE-WITH-DASHES")
      V.uppercase("UPPERCASE WITH SPACES")
      V.uppercase("UPPERCASE WITH NUMBERS 123")

      # {:error, message}
      V.uppercase("lowercase")
      V.uppercase("CamelCase")
      V.uppercase("First Character Uppercase")
      V.uppercase("With Numbers 1 2 3")
  """
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

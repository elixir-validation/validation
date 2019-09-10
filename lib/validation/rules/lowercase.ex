defmodule Validation.Rules.Lowercase do

  @doc """
  Validates whether the input is lowercase.

      # {:ok}
      V.lowercase("")
      V.lowercase("lowercase")
      V.lowercase("lowercase-with-dashes")
      V.lowercase("lowercase with spaces")
      V.lowercase("lowercase with specials characters like ã ç ê")

      # {:error, message}
      V.lowercase("UPPERCASE")
      V.lowercase("CamelCase")
      V.lowercase("First Character Uppercase")
      V.lowercase("With Numbers 1 2 3")
  """
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

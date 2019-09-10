defmodule Validation.Rules.Alpha do

  @doc """
  Validates whether the input is alpha.

      # {:ok}
      V.alpha("")
      V.alpha("a")
      V.alpha("john")
      V.alpha("doe")
      V.alpha("foobar")

      # {:error, message}
      V.alpha("123")
      V.alpha("number 100%")
      V.alpha("@#$")
      V.alpha("_")
      V.alpha("dgç")
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^[a-zA-Z]*$/)

    if regex_validation do
      {:ok}
    else
      {:error, "Invalid alpha value."}
    end
  end

  @doc """
  Validates whether the input is alpha, excluding specific characters.

      # {:ok}
      V.alpha("john_", "_")
      V.alpha("google.com", ".")
      V.alpha("john doe", " ")

      # {:error, message}
      V.alpha("john_123", "$")
      V.alpha("google.com321", "*")
      V.alpha("john doe1", "_")
  """
  @spec validate(String.t, String.t) :: Validation.default
  def validate(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    excluded_characters_list = String.codepoints(excluded_characters)

    {_, input} = Enum.map_reduce(excluded_characters_list, input, fn excluded_character, new_input ->
      new_input = String.replace(new_input, excluded_character, "")
      {excluded_character, new_input}
    end)

    validate(input)
  end
end

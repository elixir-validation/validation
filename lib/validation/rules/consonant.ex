defmodule Validation.Rules.Consonant do

  @doc """
  Validates whether the input is has only consonants.

      # {:ok}
      V.consonant("w")
      V.consonant("y")
      V.consonant("qrst")
      V.consonant("bcdfghklmnp")

      # {:error, message}
      V.consonant("a")
      V.consonant("ul")
      V.consonant("aeiou")
      V.consonant("Foo")
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^(\s|[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z])*$/)

    if regex_validation do
      {:ok}
    else
      {:error, "Invalid consonant value."}
    end
  end

  @doc """
  Validates whether the input is has only consonants, excluding specific characters.

      # {:ok}
      V.consonant("www%", "%")
      V.consonant("bcd_fgh", "_")
      V.consonant("www www__www", " _")

      # {:error, message}
      V.consonant("awww%", "%")
      V.consonant("uwwwq", "_")
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

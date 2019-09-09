defmodule Validation.Rules.Vowel do

  @doc """
  Validates whether the input is has only vowels.
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^[aeiouAEIOU]*$/)

    if regex_validation do
      {:ok}
    else
      {:error, "Invalid vowel value."}
    end
  end

  @doc """
  Validates whether the input is has only vowels, excluding specific characters.
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
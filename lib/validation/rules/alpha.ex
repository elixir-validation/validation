defmodule Validation.Rules.Alpha do
  @moduledoc false

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^[a-zA-Z]*$/)

    if regex_validation do
      {:ok}
    else
      {:error, "Invalid alpha value."}
    end
  end

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

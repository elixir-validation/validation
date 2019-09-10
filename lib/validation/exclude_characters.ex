defmodule Validation.ExcludeCharacters do
  @moduledoc false

  @spec exclude(String.t, String.t) :: String.t
  def exclude(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    excluded_characters_list = String.codepoints(excluded_characters)

    {_, input} = Enum.map_reduce(excluded_characters_list, input, fn excluded_character, new_input ->
      new_input = String.replace(new_input, excluded_character, "")
      {excluded_character, new_input}
    end)

    input
  end
end

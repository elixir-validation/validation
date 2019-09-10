defmodule Validation.Rules.Alphanumeric do

  @doc """
  Validates whether the input is alphanumeric.

      # {:ok}
      V.alphanumeric("foo123");
      V.alphanumeric("100number");

      # {:error, message}
      V.alphanumeric("number 100%");
      V.alphanumeric("foo_bar");
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^[a-zA-Z0-9]*$/)

    if regex_validation do
      {:ok}
    else
      {:error, "Invalid alphanumeric value."}
    end
  end

  @doc """
  Validates whether the input is alphanumeric, excluding specific characters.

      # {:ok}
      V.alphanumeric("foo 123", " ");
      V.alphanumeric("foo_123", "_");

      # {:error, message}
      V.alphanumeric("number 100%", "%");
      V.alphanumeric("foo_bar", "%");
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

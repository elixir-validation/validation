defmodule Validation.Rules.CPF do
  @moduledoc false

  @spec validate?(String.t()) :: boolean
  def validate?(input) when is_binary(input) do
    # Yes, we know. This code is Ugly!
    # But it works. Code ported from jsfromhell.com

    # only numbers
    c = Regex.replace(~r/\D/, input, "")

    if initial_validation(c) do
      {n, _, _, c} = loop_check(0, 10, 0, c)

      n = rem(n, 11)

      c_9 = String.at(c, 9) |> String.to_integer()
      check = if n < 2, do: 0, else: 11 - n

      if c_9 == check do
        {n, _, _, c} = loop_check(0, 11, 0, c)

        n = rem(n, 11)

        c_10 = String.at(c, 10) |> String.to_integer()
        check = if n < 2, do: 0, else: 11 - n

        c_10 == check
      else
        false
      end
    else
      false
    end
  end

  defp initial_validation(input) do
    validate_length(input) and
      validate_repeated_value(input) and
      validate_invalid_values(input)
  end

  defp validate_length(input) do
    String.length(input) == 11
  end

  defp validate_repeated_value(input) do
    first_character = String.at(input, 0)
    {:ok, pattern} = Regex.compile("^" <> first_character <> "*$")
    not String.match?(input, pattern)
  end

  defp validate_invalid_values(input) do
    input != "01234567890"
  end

  defp loop_check(n, s, i, c) when s == 1 do
    {n, s, i, c}
  end

  defp loop_check(n, s, i, c) do
    c_item = String.at(c, i) |> String.to_integer()

    n = n + c_item * s

    i = i + 1
    s = s - 1

    loop_check(n, s, i, c)
  end
end

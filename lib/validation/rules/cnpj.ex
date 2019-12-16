defmodule Validation.Rules.CNPJ do
  @moduledoc false

  @spec validate?(String.t()) :: boolean
  def validate?(input) when is_binary(input) do
    # Yes, we know. This code is Ugly!
    # But it works. Code ported from jsfromhell.com

    # only numbers
    digits = Regex.replace(~r/\D/, input, "")

    bases = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

    if validate_digits_sum(digits) and String.length(digits) == 14 do
      {_, n} =
        Enum.map_reduce(0..11, 0, fn i, n ->
          digit_item = String.at(digits, i) |> String.to_integer()
          base_item = Enum.at(bases, i + 1)

          n = n + digit_item * base_item

          {i, n}
        end)

      n = rem(n, 11)

      digit_12 = String.at(digits, 12) |> String.to_integer()
      check = if n < 2, do: 0, else: 11 - n

      if digit_12 == check do
        {_, n} =
          Enum.map_reduce(0..12, 0, fn i, n ->
            digit_item = String.at(digits, i) |> String.to_integer()
            base_item = Enum.at(bases, i)

            n = n + digit_item * base_item

            {i, n}
          end)

        n = rem(n, 11)

        digit_13 = String.at(digits, 13) |> String.to_integer()
        check = if n < 2, do: 0, else: 11 - n

        digit_13 == check
      else
        false
      end
    else
      false
    end
  end

  defp validate_digits_sum(digits_string) do
    {_, sum} =
      digits_string
      |> String.codepoints()
      |> Enum.map_reduce(0, fn digit, total ->
        digit = String.to_integer(digit)
        {digit, total + digit}
      end)

    sum > 0
  end
end

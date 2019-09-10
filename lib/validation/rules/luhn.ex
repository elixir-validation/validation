defmodule Validation.Rules.Luhn do
  @moduledoc false

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    sum = 0

    # only numbers
    digits = Regex.replace(~r/\D/, input, "")

    num_digits = String.length(digits)

    if num_digits > 0 do
      parity = rem(num_digits, 2)

      {_, sum} = Enum.map_reduce(0..(num_digits - 1), 0, fn i, sum ->
        digit_i = String.at(digits, i) |> String.to_integer

        digit =
          if parity == rem(i, 2) do
            digit = bitwise(digit_i, 1)

            digit = if 9 < digit, do: digit - 9, else: digit
          else
            digit_i
          end

        sum = sum + digit

        {i, sum}
      end)

      if rem(sum, 10) == 0 do
        {:ok}
      else
        error()
      end
    else
      error()
    end
  end

  defp bitwise(a, b) do
    {_, sum} = Enum.map_reduce(1..b, a, fn a, sum ->
      {a, sum * 2}
    end)

    sum
  end

  defp error do
    {:error, "Invalid Luhn value."}
  end
end

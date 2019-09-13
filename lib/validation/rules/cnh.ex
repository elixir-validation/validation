defmodule Validation.Rules.CNH do
  @moduledoc false

  @spec validate(String.t) :: boolean
  def validate(input) when is_binary(input) do
    # only numbers
    input = Regex.replace(~r/\D/, input, "")

    if String.length(input) == 11 do
      # validate digits using a modulus 11 algorithm
      {_, s1, s2, _, input} = validate_digits(0, 0, 0, 9, input)

      dv1 = rem(s1, 11)

      input_9 = String.at(input, 9) |> String.to_integer
      check   = if dv1 > 9, do: 0, else: dv1

      if (input_9 == check) do
        dv2 = rem(s2, 11) - (if dv1 > 9, do: 2, else: 0);

        input_10 = String.at(input, 10) |> String.to_integer

        check =
          if dv2 < 0 do
            dv2 + 11
          else
            if dv2 > 9, do: 0, else: dv2
          end

        input_10 == check
      else
        false
      end
    else
      false
    end
  end

  defp validate_digits(c, s1, s2, p, input) when c == 9 do
    {c, s1, s2, p, input}
  end

  defp validate_digits(c, s1, s2, p, input) do
    s1_digit = String.to_integer(String.at(input, c)) * p
    s2_digit = String.to_integer(String.at(input, c)) * (10 - p)

    s1 = s1 + s1_digit
    s2 = s2 + s2_digit

    c = c + 1
    p = p - 1

    validate_digits(c, s1, s2, p, input)
  end
end

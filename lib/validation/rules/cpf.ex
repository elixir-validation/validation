defmodule Validation.Rules.CPF do

  @doc """
  Validates whether the input is a valid CPF.
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    # Ugly code. But it works.
    # Code ported from jsfromhell.com

    # only numbers
    c = Regex.replace(~r/\D/, input, "")

    if not initial_validation(c) do
      error_result()
    else
      {n, s, i, c} = loop_check(0, 10, 0, c)

      n = rem(n, 11)

      c_9   = String.at(c, 9) |> String.to_integer
      check = if n < 2, do: 0, else: 11 - n

      if c_9 != check do
        error_result()
      else
        {n, s, i, c} = loop_check(0, 11, 0, c)

        n = rem(n, 11)

        c_10  = String.at(c, 10) |> String.to_integer
        check = if n < 2, do: 0, else: 11 - n

        if c_10 == check do
          {:ok}
        else
          error_result()
        end
      end
    end
  end

  defp initial_validation(input) do
        validate_length(input)
    and validate_repeated_value(input)
    and validate_invalid_values(input)
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

  defp error_result do
    {:error, "Invalid CPF input."}
  end

  defp loop_check(n, s, i, c) when s == 1 do
    {n, s, i, c}
  end

  defp loop_check(n, s, i, c) do
    c_item = String.at(c, i) |> String.to_integer

    n = n + (c_item * s)

    i = i + 1
    s = s - 1

    {n, s, i, c} = loop_check(n, s, i, c)
  end
end

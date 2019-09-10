defmodule Validation.Rules.Odd do

  @doc """
  Validates whether the input is odd.

      # {:ok}
      V.odd(1)
      V.odd(5)
      V.odd(-11)
      V.odd(9999999)

      # {:error, message}
      V.odd(0)
      V.odd(8)
      V.odd(-100)
      V.odd(9999998)
  """
  @spec validate(Integer.t) :: Validation.default
  def validate(input) when is_integer(input) do
    import Integer, only: [is_odd: 1]

    if Integer.is_odd(input) do
      {:ok}
    else
      {:error, "Invalid odd value."}
    end
  end
end

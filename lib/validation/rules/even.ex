defmodule Validation.Rules.Even do

  @doc """
  Validates whether the input is even.

      # {:ok}
      V.even(0)
      V.even(2)
      V.even(4)
      V.even(-2)
      V.even(9999998)

      # {:error, message}
      V.even(1)
      V.even(5)
      V.even(-3)
      V.even(9999999)
  """
  @spec validate(Integer.t) :: Validation.default
  def validate(input) when is_integer(input) do
    import Integer, only: [is_even: 1]

    if Integer.is_even(input) do
      {:ok}
    else
      {:error, "Invalid even value."}
    end
  end
end

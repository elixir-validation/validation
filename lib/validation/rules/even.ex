defmodule Validation.Rules.Even do

  @doc """
  Validates whether the input is even.
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

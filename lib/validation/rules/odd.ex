defmodule Validation.Rules.Odd do
  @moduledoc false

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

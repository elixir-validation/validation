defmodule Validation.Rules.No do

  # @TODO: support other languages

  @doc """
  Validates if value is considered as "No".

      # {:ok}
      V.no("N")
      V.no("n")
      V.no("Nay")
      V.no("No")
      V.no("Nope")
      V.no("Not")

      # {:error, message}
      V.no("Donnot")
      V.no("Never")
      V.no("Niet")
      V.no("Noooooooo")
      V.no("Não")
      V.no("não")
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^n(o(t|pe)?|ix|ay)?$/i)

    if regex_validation do
      {:ok}
    else
      {:error, ~s(Invalid "no" value.")}
    end
  end
end

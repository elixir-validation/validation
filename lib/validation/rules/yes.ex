defmodule Validation.Rules.Yes do

  # @TODO: support other languages

  @doc """
  Validates if value is considered as "Yes".

      # {:ok}
      V.yes("Y")
      V.yes("Yea")
      V.yes("Yeah")
      V.yes("Yep")
      V.yes("Yes")
      V.yes("yes")

      # {:error, message}
      V.yes("let\\"s thrown an error")
      V.yes("Yydoesnotmatter")
      V.yes("Si")
      V.yes("Sim")
      V.yes("Yoo")
      V.yes("Yiip")
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    regex_validation = String.match?(input, ~r/^y(eah?|ep|es)?$/i)

    if regex_validation do
      {:ok}
    else
      {:error, ~s(Invalid "yes" value.")}
    end
  end
end

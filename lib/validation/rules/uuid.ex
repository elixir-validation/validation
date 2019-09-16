defmodule Validation.Rules.UUID do
  @moduledoc false

  @pattern_replace "__VERSION__";
  @pattern_format  "^[0-9a-f]{8}-[0-9a-f]{4}-__VERSION__[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$";

  @spec validate?(String.t, integer) :: boolean
  def validate?(input, version \\ nil) when is_binary(input) and (is_integer(version) or is_nil(version)) do
    validate_supported_versions(version)

    pattern_string = create_pattern(version)
    {:ok, pattern} = Regex.compile(pattern_string, "i")

    String.match?(input, pattern)
  end

  defp validate_supported_versions(version) do
    unless is_nil(version) do
      unless Enum.member?([1, 3, 4, 5], version) do
        raise "Only versions 1, 3, 4, and 5 are supported."
      end
    end
  end

  defp create_pattern(version) do
    if is_nil(version) do
      String.replace(@pattern_format, @pattern_replace, "[13-5]")
    else
      String.replace(@pattern_format, @pattern_replace, version |> Integer.to_string)
    end
  end
end

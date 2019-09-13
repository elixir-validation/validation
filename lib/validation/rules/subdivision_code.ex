defmodule Validation.Rules.SubdivisionCode do
  alias Validation.Rules.CountryCode

  @moduledoc false

  @spec validate(String.t, String.t) :: boolean
  def validate(country, subdivision) when is_binary(country) and is_binary(subdivision) do
    unless CountryCode.validate(country) do
      raise "Invalid country code (ISO 3166 alpha-2)."
    end

    {:ok, root} = File.cwd()

    path = root <> "/data/iso_3166-2/" <> "#{country}.json"

    {:ok, country_string} = File.read(path)

    data = Poison.decode!(country_string)

    Map.has_key?(data, "subdivisions")
      and Map.has_key?(data["subdivisions"], subdivision)
  end
end

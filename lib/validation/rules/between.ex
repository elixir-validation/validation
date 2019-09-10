defmodule Validation.Rules.Between do
  @moduledoc false

  @spec validate(number | String.t, number | String.t, number | String.t) :: boolean
  def validate(value, min, max) when
       (is_number(value) and is_number(min) and is_number(max))
    or (is_binary(value) and is_binary(min) and is_binary(max))
  do
    if is_binary(min) and is_binary(max) do
      if String.length(min) != 1 do
        raise "Minimum param has to be a single letter."
      end

      if String.length(max) != 1 do
        raise "Maximum param has to be a single letter."
      end
    end

    if min > max do
      raise "Minimum param can't be greater than maximum param."
    end

    value >= min and value <= max
  end
end

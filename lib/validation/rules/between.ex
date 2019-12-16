defmodule Validation.Rules.Between do
  @moduledoc false

  @spec validate?(number, number, number) :: boolean
  def validate?(value, min, max)
      when is_number(value) and is_number(min) and is_number(max) and
             min <= max do
    value >= min and value <= max
  end

  def validate?(value, min, max)
      when is_number(value) and is_number(min) and is_number(max) do
    raise "Minimum param can't be greater than maximum param."
  end

  @spec validate?(String.t(), String.t(), String.t()) :: boolean
  def validate?(value, min, max)
      when is_binary(value) and is_binary(min) and is_binary(max) do
    _validate_string?(value, min, max, String.length(min), String.length(max))
  end

  def _validate_string?(value, min, max, length_min, length_max)
      when min <= max and length_min == 1 and length_max == 1 do
    value >= min and value <= max
  end

  def _validate_string?(_value, _min, _max, length_min, length_max)
      when length_min != 1 and length_max == 1 do
    raise "Minimum param has to be a single letter."
  end

  def _validate_string?(_value, _min, _max, _length_min, length_max)
      when length_max != 1 do
    raise "Maximum param has to be a single letter."
  end

  def _validate_string?(_value, min, max, _length_min, _length_max)
      when min > max do
    raise "Minimum param can't be greater than maximum param."
  end
end

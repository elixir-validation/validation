defmodule Validation.Rules.Luhn do
  @moduledoc false

  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    """
    for ($i = 0; $i < $numDigits; ++$i) {
        $digit = $digits[$i];

        if ($parity == ($i % 2)) {
            $digit <<= 1;
            if (9 < $digit) {
                $digit = $digit - 9;
            }
        }

        $sum += $digit;
    }

    return ($sum % 10) == 0;
    """

    sum = 0

    # only numbers
    digits = Regex.replace(~r/\D/, input, "")

    num_digits = String.length(digits)
    parity = rem(num_digits, 2)





  end
end

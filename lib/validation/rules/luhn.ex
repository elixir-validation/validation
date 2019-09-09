defmodule Validation.Rules.Luhn do

  @doc """
  Validates whether the input is a valid Luhn.
  """
  @spec validate(String.t) :: Validation.default
  def validate(input) when is_binary(input) do
    """
    $sum = 0;
    $digits = array_map('intval', str_split($input));
    $numDigits = count($digits);
    $parity = $numDigits % 2;
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


  end
end

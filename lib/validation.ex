defmodule Validation do

  @moduledoc """
  @TODO: update docs.. wrapper to the rules
  """

  @doc """
  Validates whether the input is alpha.

      # true
      V.alpha("")
      V.alpha("a")
      V.alpha("john")
      V.alpha("doe")
      V.alpha("foobar")

      # false
      V.alpha("123")
      V.alpha("number 100%")
      V.alpha("@#$")
      V.alpha("_")
      V.alpha("dgç")
  """
  @spec alpha(String.t) :: boolean
  def alpha(input) when is_binary(input) do
    Validation.Rules.Alpha.validate(input)
  end

  @doc """
  Validates whether the input is alpha, excluding specific characters.

      # true
      V.alpha("john_", "_")
      V.alpha("google.com", ".")
      V.alpha("john doe", " ")

      # false
      V.alpha("john_123", "$")
      V.alpha("google.com321", "*")
      V.alpha("john doe1", "_")
  """
  @spec alpha(String.t, String.t) :: boolean
  def alpha(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Alpha.validate(input, excluded_characters)
  end

  @doc """
  Validates whether the input is alphanumeric.

      # true
      V.alphanumeric("foo123");
      V.alphanumeric("100number");

      # false
      V.alphanumeric("number 100%");
      V.alphanumeric("foo_bar");
  """
  @spec alphanumeric(String.t) :: boolean
  def alphanumeric(input) when is_binary(input) do
    Validation.Rules.Alphanumeric.validate(input)
  end

  @doc """
  Validates whether the input is alphanumeric, excluding specific characters.

      # true
      V.alphanumeric("foo 123", " ");
      V.alphanumeric("foo_123", "_");

      # false
      V.alphanumeric("number 100%", "%");
      V.alphanumeric("foo_bar", "%");
  """
  @spec alphanumeric(String.t, String.t) :: boolean
  def alphanumeric(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Alphanumeric.validate(input, excluded_characters)
  end

  @doc """
  Validates ranges.

      # true
      V.between(15, 10, 20)
      V.between(70, 0, 100)

      # false
      V.between(15, 20, 30)
      V.between(70, 300, 999)
  """
  @spec between(number, number, number) :: boolean
  def between(value, min, max) when is_number(value) and is_number(min) and is_number(max) do
    Validation.Rules.Between.validate(value, min, max)
  end

  @doc """
  Validates whether the input is a valid CNH (brazilian driver license ID).

      # true
      V.cnh("02650306461")
      V.cnh("04397322870")
      V.cnh("04375701302")
      V.cnh("02996843266")
      V.cnh("04375700501")

      # false
      V.cnh("")
      V.cnh("0000000000")
      V.cnh("9999999999")
      V.cnh("0265131640")
      V.cnh("0439732280")
  """
  @spec cnh(String.t) :: boolean
  def cnh(input) when is_binary(input) do
    Validation.Rules.CNH.validate(input)
  end

  @doc """
  Validates whether the input is a valid CNPJ (brazilian company ID).

      # true
      V.cnpj("32.063.364/0001-07")
      V.cnpj("27.355.204/0001-00")
      V.cnpj("36.310.327/0001-07")
      V.cnpj("37550610000179")
      V.cnpj("12774546000189")

      # false
      V.cnpj("12.345.678/9012-34")
      V.cnpj("11.111.111/1111-11")
      V.cnpj("00000000000000")
      V.cnpj("99-010-0.")
  """
  @spec cnpj(String.t) :: boolean
  def cnpj(input) when is_binary(input) do
    Validation.Rules.CNPJ.validate(input)
  end

  @doc """
  Validates whether the input is a valid CPF (brazilian ID).

      # true
      V.cpf("350.45261819")
      V.cpf("693-319-118-40")
      V.cpf("11598647644")
      V.cpf("86734718697")
      V.cpf("3.6.8.8.9.2.5.5.4.8.8")

      # false
      V.cpf("")
      V.cpf("01234567890")
      V.cpf("000.000.000-00")
      V.cpf("111.222.444-05")
      V.cpf("999999999.99")
      V.cpf("8.8.8.8.8.8.8.8.8.8.8")
      V.cpf("693-319-110-40")
  """
  @spec cpf(String.t) :: boolean
  def cpf(input) when is_binary(input) do
    Validation.Rules.CPF.validate(input)
  end

  @doc """
  Validates whether the input is a valid credit card.

      # true
      V.credit_card("2223000048400011")
      V.credit_card("2222 4000 4124 0011")
      V.credit_card("4024.0071.5336.1885")

      # false
      V.credit_card("it isnt my credit c)ard number")
      V.credit_card("1234 1234 1234 1234")
      V.credit_card("1234.1234.1234.12__34")
  """
  @spec credit_card(String.t) :: boolean
  def credit_card(input) when is_binary(input) do
    Validation.Rules.CreditCard.validate(input)
  end

  @doc """
  Validates whether the input is a valid American Express (amex) credit card.

      # true
      V.credit_card_amex("340-3161-9380-9364")

      # false
      V.credit_card_amex("5376 7473 9720 8720")  # master
      V.credit_card_amex("4024.0071.5336.1885")  # visa
  """
  @spec credit_card_amex(String.t) :: boolean
  def credit_card_amex(input) when is_binary(input) do
    Validation.Rules.CreditCard.Amex.validate(input)
  end

  @doc """
  Validates whether the input is a valid Diners credit card.

      # true
      V.credit_card_diners("30351042633884")

      # false
      V.credit_card_diners("5376 7473 9720 8720")  # master
      V.credit_card_diners("4024.0071.5336.1885")  # visa
  """
  @spec credit_card_diners(String.t) :: boolean
  def credit_card_diners(input) when is_binary(input) do
    Validation.Rules.CreditCard.Diners.validate(input)
  end

  @doc """
  Validates whether the input is a valid Discover credit card.

      # true
      V.credit_card_discover("6011000990139424")

      # false
      V.credit_card_discover("5376 7473 9720 8720")  # master
      V.credit_card_discover("4024.0071.5336.1885")  # visa
  """
  @spec credit_card_discover(String.t) :: boolean
  def credit_card_discover(input) when is_binary(input) do
    Validation.Rules.CreditCard.Discover.validate(input)
  end

  @doc """
  Validates whether the input is a valid Jcb credit card.

      # true
      V.credit_card_jcb("3566002020360505")

      # false
      V.credit_card_jcb("5376 7473 9720 8720")  # master
      V.credit_card_jcb("4024.0071.5336.1885")  # visa
  """
  @spec credit_card_jcb(String.t) :: boolean
  def credit_card_jcb(input) when is_binary(input) do
    Validation.Rules.CreditCard.Jcb.validate(input)
  end

  @doc """
  Validates whether the input is a valid Master credit card.

      # true
      V.credit_card_master("5376 7473 9720 8720")

      # false
      V.credit_card_master("340-3161-9380-9364")   # amex
      V.credit_card_master("4024.0071.5336.1885")  # visa
  """
  @spec credit_card_master(String.t) :: boolean
  def credit_card_master(input) when is_binary(input) do
    Validation.Rules.CreditCard.Master.validate(input)
  end

  @doc """
  Validates whether the input is a valid VISA credit card.

      # true
      V.credit_card_visa("4024 007 193 879")
      V.credit_card_visa("4024.0071.5336.1885")

      # false
      V.credit_card_visa("340-3161-9380-9364")   # amex
      V.credit_card_visa("5376 7473 9720 8720")  # master
  """
  @spec credit_card_visa(String.t) :: boolean
  def credit_card_visa(input) when is_binary(input) do
    Validation.Rules.CreditCard.Visa.validate(input)
  end

  @doc """
  Validates whether the input is has only consonants.

      # true
      V.consonant("w")
      V.consonant("y")
      V.consonant("qrst")
      V.consonant("bcdfghklmnp")

      # false
      V.consonant("a")
      V.consonant("ul")
      V.consonant("aeiou")
      V.consonant("Foo")
  """
  @spec consonant(String.t) :: boolean
  def consonant(input) when is_binary(input) do
    Validation.Rules.Consonant.validate(input)
  end

  @doc """
  Validates whether the input is has only consonants, excluding specific characters.

      # true
      V.consonant("www%", "%")
      V.consonant("bcd_fgh", "_")
      V.consonant("www www__www", " _")

      # false
      V.consonant("awww%", "%")
      V.consonant("uwwwq", "_")
  """
  @spec consonant(String.t, String.t) :: boolean
  def consonant(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Consonant.validate(input, excluded_characters)
  end

  @doc """
  Validates whether the input is a valid digit.

      # true
      V.digit("165")
      V.digit("01650")
      V.digit("01")

      # false
      V.digit("")
      V.digit("-1.1")
      V.digit("-12")
      V.digit("1.0")
  """
  @spec digit(String.t) :: boolean
  def digit(input) when is_binary(input) do
    Validation.Rules.Digit.validate(input)
  end

  @doc """
  Validates whether the input is a valid digit, excluding specific characters.

      # true
      V.digit("1.0", ".")
      V.digit("16-50", "-")

      # false
      V.digit("")
      V.digit("1.%0", ".")
      V.digit("3333316-5.0/", "-.")
  """
  @spec digit(String.t, String.t) :: boolean
  def digit(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Digit.validate(input, excluded_characters)
  end

  @doc """
  Validates whether the input is a valid email. See [RFC822](http://www.ex-parrot.com/~pdw/Mail-RFC822-Address.html)

      # true
      V.email("john@gmail.com")
      V.email("hello+world@mydomain.com")
      V.email("mail.email@foo.bar.com")

      # false
      V.email("plainaddress")
      V.email("#@%^%#$@#$@#.com")
      V.email("test@test.com.")
      V.email(".test@test.com")
      V.email("@domain.com")
  """
  @spec email(String.t) :: boolean
  def email(input) when is_binary(input) do
    Validation.Rules.Email.validate(input)
  end

  @doc """
  Validates whether the input is even.

      # true
      V.even(0)
      V.even(2)
      V.even(4)
      V.even(-2)
      V.even(9999998)

      # false
      V.even(1)
      V.even(5)
      V.even(-3)
      V.even(9999999)
  """
  @spec even(Integer.t) :: boolean
  def even(input) when is_integer(input) do
    Validation.Rules.Even.validate(input)
  end

  @doc """
  Validates whether the input is lowercase.

      # true
      V.lowercase("")
      V.lowercase("lowercase")
      V.lowercase("lowercase-with-dashes")
      V.lowercase("lowercase with spaces")
      V.lowercase("lowercase with specials characters like ã ç ê")

      # false
      V.lowercase("UPPERCASE")
      V.lowercase("CamelCase")
      V.lowercase("First Character Uppercase")
      V.lowercase("With Numbers 1 2 3")
  """
  @spec lowercase(String.t) :: boolean
  def lowercase(input) when is_binary(input) do
    Validation.Rules.Lowercase.validate(input)
  end

  @doc """
  Validates whether the input is valid Luhn.

      # true
      V.luhn("9773725370")
      V.luhn("2222400041240011")
      V.luhn("340316193809364")

      # false
      V.luhn("")
      V.luhn("true")
      V.luhn("8888888888888887")
  """
  @spec luhn(String.t) :: boolean
  def luhn(input) when is_binary(input) do
    Validation.Rules.Luhn.validate(input)
  end

  @doc """
  Validates whether the input is a valid MAC address.

      # true
      V.mac_address("00:11:22:33:44:55")
      V.mac_address("66-77-88-99-aa-bb")
      V.mac_address("AF:0F:bd:12:44:ba")

      # false
      V.mac_address("")
      V.mac_address("00-1122:33:44:55")
  """
  @spec mac_address(String.t) :: boolean
  def mac_address(input) when is_binary(input) do
    Validation.Rules.MacAddress.validate(input)
  end

  @doc """
  Validates if value is considered as "No".

      # true
      V.no("N")
      V.no("n")
      V.no("Nay")
      V.no("No")
      V.no("Nope")
      V.no("Not")

      # false
      V.no("Donnot")
      V.no("Never")
      V.no("Niet")
      V.no("Noooooooo")
      V.no("Não")
      V.no("não")
  """
  @spec no(String.t) :: boolean
  def no(input) when is_binary(input) do
    Validation.Rules.No.validate(input)
  end

  @doc """
  Validates whether the input is odd.

      # true
      V.odd(1)
      V.odd(5)
      V.odd(-11)
      V.odd(9999999)

      # false
      V.odd(0)
      V.odd(8)
      V.odd(-100)
      V.odd(9999998)
  """
  @spec odd(Integer.t) :: boolean
  def odd(input) when is_integer(input) do
    Validation.Rules.Odd.validate(input)
  end

  @doc """
  Validates whether the input is uppercase.

      # true
      V.uppercase("")
      V.uppercase("UPPERCASE")
      V.uppercase("UPPERCASE-WITH-DASHES")
      V.uppercase("UPPERCASE WITH SPACES")
      V.uppercase("UPPERCASE WITH NUMBERS 123")

      # false
      V.uppercase("lowercase")
      V.uppercase("CamelCase")
      V.uppercase("First Character Uppercase")
      V.uppercase("With Numbers 1 2 3")
  """
  @spec uppercase(String.t) :: boolean
  def uppercase(input) when is_binary(input) do
    Validation.Rules.Uppercase.validate(input)
  end

  @doc """
  Validates whether the input is has only vowels.

      # true
      V.vowel("a")
      V.vowel("o")
      V.vowel("u")
      V.vowel("aeiou")

      # false
      V.vowel("b")
      V.vowel("ul")
      V.vowel("16")
      V.vowel("\\r")
  """
  @spec vowel(String.t) :: boolean
  def vowel(input) when is_binary(input) do
    Validation.Rules.Vowel.validate(input)
  end

  @doc """
  Validates whether the input is has only vowels, excluding specific characters.

      # true
      V.vowel("aaaa==", "=")
      V.vowel("aeoiu!!--", "!-")

      # false
      V.vowel("b==aaaa", "=")
      V.vowel("bc==aeoiu", "b!-")
  """
  @spec vowel(String.t, String.t) :: boolean
  def vowel(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Vowel.validate(input, excluded_characters)
  end

  @doc """
  Validates if value is considered as "Yes".

      # true
      V.yes("Y")
      V.yes("Yea")
      V.yes("Yeah")
      V.yes("Yep")
      V.yes("Yes")
      V.yes("yes")

      # false
      V.yes("let\\"s thrown an error")
      V.yes("Yydoesnotmatter")
      V.yes("Si")
      V.yes("Sim")
      V.yes("Yoo")
      V.yes("Yiip")
  """
  @spec yes(String.t) :: boolean
  def yes(input) when is_binary(input) do
    Validation.Rules.Yes.validate(input)
  end
end

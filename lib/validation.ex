defmodule Validation do

  @type default :: {:ok} | {:error, String.t}

  @moduledoc """
  @TODO: update docs.. wrapper to the rules
  """

  @doc """
  Validates whether the input is alpha.

      # {:ok}
      V.alpha("")
      V.alpha("a")
      V.alpha("john")
      V.alpha("doe")
      V.alpha("foobar")

      # {:error, message}
      V.alpha("123")
      V.alpha("number 100%")
      V.alpha("@#$")
      V.alpha("_")
      V.alpha("dgç")
  """
  @spec alpha(String.t) :: Validation.default
  def alpha(input) when is_binary(input) do
    Validation.Rules.Alpha.validate(input)
  end

  @doc """
  Validates whether the input is alpha, excluding specific characters.

      # {:ok}
      V.alpha("john_", "_")
      V.alpha("google.com", ".")
      V.alpha("john doe", " ")

      # {:error, message}
      V.alpha("john_123", "$")
      V.alpha("google.com321", "*")
      V.alpha("john doe1", "_")
  """
  @spec alpha(String.t, String.t) :: Validation.default
  def alpha(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Alpha.validate(input, excluded_characters)
  end

  @doc """
  Validates whether the input is alphanumeric.

      # {:ok}
      V.alphanumeric("foo123");
      V.alphanumeric("100number");

      # {:error, message}
      V.alphanumeric("number 100%");
      V.alphanumeric("foo_bar");
  """
  @spec alphanumeric(String.t) :: default
  def alphanumeric(input) when is_binary(input) do
    Validation.Rules.Alphanumeric.validate(input)
  end

  @doc """
  Validates whether the input is alphanumeric, excluding specific characters.

      # {:ok}
      V.alphanumeric("foo 123", " ");
      V.alphanumeric("foo_123", "_");

      # {:error, message}
      V.alphanumeric("number 100%", "%");
      V.alphanumeric("foo_bar", "%");
  """
  @spec alphanumeric(String.t, String.t) :: Validation.default
  def alphanumeric(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Alphanumeric.validate(input, excluded_characters)
  end

  @doc """
  Validates ranges.

      # {:ok}
      V.between(15, 10, 20)
      V.between(70, 0, 100)

      # {:error, message}
      V.between(15, 20, 30)
      V.between(70, 300, 999)
  """
  @spec between(number, number, number) :: Validation.default
  def between(value, min, max) when is_number(value) and is_number(min) and is_number(max) do
    Validation.Rules.Between.validate(value, min, max)
  end

  @doc """
  Validates whether the input is a valid CNH (brazilian driver license ID).

      # {:ok}
      V.cnh("02650306461")
      V.cnh("04397322870")
      V.cnh("04375701302")
      V.cnh("02996843266")
      V.cnh("04375700501")

      # {:error, message}
      V.cnh("")
      V.cnh("0000000000")
      V.cnh("9999999999")
      V.cnh("0265131640")
      V.cnh("0439732280")
  """
  @spec cnh(String.t) :: Validation.default
  def cnh(input) when is_binary(input) do
    Validation.Rules.CNH.validate(input)
  end

  @doc """
  Validates whether the input is a valid CNPJ (brazilian company ID).

      # {:ok}
      V.cnpj("32.063.364/0001-07")
      V.cnpj("27.355.204/0001-00")
      V.cnpj("36.310.327/0001-07")
      V.cnpj("37550610000179")
      V.cnpj("12774546000189")

      # {:error, message}
      V.cnpj("12.345.678/9012-34")
      V.cnpj("11.111.111/1111-11")
      V.cnpj("00000000000000")
      V.cnpj("99-010-0.")
  """
  @spec cnpj(String.t) :: Validation.default
  def cnpj(input) when is_binary(input) do
    Validation.Rules.CNPJ.validate(input)
  end

  @doc """
  Validates whether the input is a valid CPF (brazilian ID).

      # {:ok}
      V.cpf("350.45261819")
      V.cpf("693-319-118-40")
      V.cpf("11598647644")
      V.cpf("86734718697")
      V.cpf("3.6.8.8.9.2.5.5.4.8.8")

      # {:error, message}
      V.cpf("")
      V.cpf("01234567890")
      V.cpf("000.000.000-00")
      V.cpf("111.222.444-05")
      V.cpf("999999999.99")
      V.cpf("8.8.8.8.8.8.8.8.8.8.8")
      V.cpf("693-319-110-40")
  """
  @spec cpf(String.t) :: Validation.default
  def cpf(input) when is_binary(input) do
    Validation.Rules.CPF.validate(input)
  end

  @doc """
  Validates whether the input is has only consonants.

      # {:ok}
      V.consonant("w")
      V.consonant("y")
      V.consonant("qrst")
      V.consonant("bcdfghklmnp")

      # {:error, message}
      V.consonant("a")
      V.consonant("ul")
      V.consonant("aeiou")
      V.consonant("Foo")
  """
  @spec consonant(String.t) :: Validation.default
  def consonant(input) when is_binary(input) do
    Validation.Rules.Consonant.validate(input)
  end

  @doc """
  Validates whether the input is has only consonants, excluding specific characters.

      # {:ok}
      V.consonant("www%", "%")
      V.consonant("bcd_fgh", "_")
      V.consonant("www www__www", " _")

      # {:error, message}
      V.consonant("awww%", "%")
      V.consonant("uwwwq", "_")
  """
  @spec consonant(String.t, String.t) :: Validation.default
  def consonant(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Consonant.validate(input, excluded_characters)
  end

  @doc """
  Validates whether the input is even.

      # {:ok}
      V.even(0)
      V.even(2)
      V.even(4)
      V.even(-2)
      V.even(9999998)

      # {:error, message}
      V.even(1)
      V.even(5)
      V.even(-3)
      V.even(9999999)
  """
  @spec even(Integer.t) :: Validation.default
  def even(input) when is_integer(input) do
    Validation.Rules.Even.validate(input)
  end

  @doc """
  Validates whether the input is lowercase.

      # {:ok}
      V.lowercase("")
      V.lowercase("lowercase")
      V.lowercase("lowercase-with-dashes")
      V.lowercase("lowercase with spaces")
      V.lowercase("lowercase with specials characters like ã ç ê")

      # {:error, message}
      V.lowercase("UPPERCASE")
      V.lowercase("CamelCase")
      V.lowercase("First Character Uppercase")
      V.lowercase("With Numbers 1 2 3")
  """
  @spec lowercase(String.t) :: Validation.default
  def lowercase(input) when is_binary(input) do
    Validation.Rules.Lowercase.validate(input)
  end

  @doc """
  Validates whether the input is a valid MAC address.

      # {:ok}
      V.mac_address("00:11:22:33:44:55")
      V.mac_address("66-77-88-99-aa-bb")
      V.mac_address("AF:0F:bd:12:44:ba")

      # {:error, message}
      V.mac_address("")
      V.mac_address("00-1122:33:44:55")
  """
  @spec mac_address(String.t) :: default
  def mac_address(input) when is_binary(input) do
    Validation.Rules.MacAddress.validate(input)
  end

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
  @spec no(String.t) :: Validation.default
  def no(input) when is_binary(input) do
    Validation.Rules.No.validate(input)
  end

  @doc """
  Validates whether the input is odd.

      # {:ok}
      V.odd(1)
      V.odd(5)
      V.odd(-11)
      V.odd(9999999)

      # {:error, message}
      V.odd(0)
      V.odd(8)
      V.odd(-100)
      V.odd(9999998)
  """
  @spec odd(Integer.t) :: Validation.default
  def odd(input) when is_integer(input) do
    Validation.Rules.Odd.validate(input)
  end

  @doc """
  Validates whether the input is uppercase.

      # {:ok}
      V.uppercase("")
      V.uppercase("UPPERCASE")
      V.uppercase("UPPERCASE-WITH-DASHES")
      V.uppercase("UPPERCASE WITH SPACES")
      V.uppercase("UPPERCASE WITH NUMBERS 123")

      # {:error, message}
      V.uppercase("lowercase")
      V.uppercase("CamelCase")
      V.uppercase("First Character Uppercase")
      V.uppercase("With Numbers 1 2 3")
  """
  @spec uppercase(String.t) :: Validation.default
  def uppercase(input) when is_binary(input) do
    Validation.Rules.Uppercase.validate(input)
  end

  @doc """
  Validates whether the input is has only vowels.

      # {:ok}
      V.vowel("a")
      V.vowel("o")
      V.vowel("u")
      V.vowel("aeiou")

      # {:error, message}
      V.vowel("b")
      V.vowel("ul")
      V.vowel("16")
      V.vowel("\r")
  """
  @spec vowel(String.t) :: Validation.default
  def vowel(input) when is_binary(input) do
    Validation.Rules.Vowel.validate(input)
  end

  @doc """
  Validates whether the input is has only vowels.

      # {:ok}
      V.vowel("aaaa==", "=")
      V.vowel("aeoiu!!--", "!-")

      # {:error, message}
      V.vowel("b==aaaa", "=")
      V.vowel("bc==aeoiu", "b!-")
  """
  @spec vowel(String.t, String.t) :: Validation.default
  def vowel(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Vowel.validate(input, excluded_characters)
  end

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
      V.yes("let"s thrown an error")
      V.yes("Yydoesnotmatter")
      V.yes("Si")
      V.yes("Sim")
      V.yes("Yoo")
      V.yes("Yiip")
  """
  @spec yes(String.t) :: Validation.default
  def yes(input) when is_binary(input) do
    Validation.Rules.Yes.validate(input)
  end
end

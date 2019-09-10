defmodule Validation do

  @type default :: {:ok} | {:error, String.t}

  @moduledoc """
  @TODO: update docs.. wrapper to the rules
  """








  @doc """
  Validates whether the input is alpha.

      # {:ok}
      V.validate("")
      V.validate("a")
      V.validate("john")
      V.validate("doe")
      V.validate("foobar")

      # {:error, _message}
      V.validate("123")
      V.validate("number 100%")
      V.validate("@#$")
      V.validate("_")
      V.validate("dgç")
  """
  @spec alpha(String.t) :: Validation.default
  def alpha(input) when is_binary(input) do
    Validation.Rules.Alpha.validate(input)
  end

  @doc """
  Validates whether the input is alpha, excluding specific characters.

      # {:ok}
      V.validate("john_", "_")
      V.validate("google.com", ".")
      V.validate("john doe", " ")

      # {:error, _message}
      V.validate("john_123", "$")
      V.validate("google.com321", "*")
      V.validate("john doe1", "_")
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

      # {:error, _message}
      V.alphanumeric('number 100%');
      V.alphanumeric('foo_bar');
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

      # {:error, _message}
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
      V.validate(15, 10, 20)
      V.validate(70, 0, 100)

      # {:error, _message}
      V.validate(15, 20, 30)
      V.validate(70, 300, 999)
  """
  @spec between(number, number, number) :: Validation.default
  def between(value, min, max) when is_number(value) and is_number(min) and is_number(max) do
    Validation.Rules.Between.validate(value, min, max)
  end

  @doc """
  Validates whether the input is a valid CNH (brazilian driver license ID).

      # {:ok}
      V.validate("02650306461")
      V.validate("04397322870")
      V.validate("04375701302")
      V.validate("02996843266")
      V.validate("04375700501")

      # {:error, _message}
      V.validate("")
      V.validate("0000000000")
      V.validate("9999999999")
      V.validate("0265131640")
      V.validate("0439732280")
  """
  @spec cnh(String.t) :: Validation.default
  def cnh(input) when is_binary(input) do
    Validation.Rules.CNH.validate(input)
  end

  @doc """
  Validates whether the input is a valid CNPJ (brazilian company ID).

      # {:ok}
      V.validate("32.063.364/0001-07")
      V.validate("27.355.204/0001-00")
      V.validate("36.310.327/0001-07")
      V.validate("37550610000179")
      V.validate("12774546000189")

      # {:error, _message}
      V.validate("12.345.678/9012-34")
      V.validate("11.111.111/1111-11")
      V.validate("00000000000000")
      V.validate("99-010-0.")
  """
  @spec cnpj(String.t) :: Validation.default
  def cnpj(input) when is_binary(input) do
    Validation.Rules.CNPJ.validate(input)
  end

  @doc """
  Validates whether the input is a valid CPF (brazilian ID).

      # {:ok}
      V.validate("350.45261819")
      V.validate("693-319-118-40")
      V.validate("11598647644")
      V.validate("86734718697")
      V.validate("3.6.8.8.9.2.5.5.4.8.8")

      # {:error, _message}
      V.validate("")
      V.validate("01234567890")
      V.validate("000.000.000-00")
      V.validate("111.222.444-05")
      V.validate("999999999.99")
      V.validate("8.8.8.8.8.8.8.8.8.8.8")
      V.validate("693-319-110-40")
  """
  @spec cpf(String.t) :: Validation.default
  def cpf(input) when is_binary(input) do
    Validation.Rules.CPF.validate(input)
  end

  @doc """
  Validates whether the input is has only consonants.

      # {:ok}
      V.validate("w")
      V.validate("y")
      V.validate("qrst")
      V.validate("bcdfghklmnp")

      # {:error, _message}
      V.validate("a")
      V.validate("ul")
      V.validate("aeiou")
      V.validate("Foo")
  """
  @spec consonant(String.t) :: Validation.default
  def consonant(input) when is_binary(input) do
    Validation.Rules.Consonant.validate(input)
  end

  @doc """
  Validates whether the input is has only consonants, excluding specific characters.

      # {:ok}
      V.validate("www%", "%")
      V.validate("bcd_fgh", "_")
      V.validate("www www__www", " _")

      # {:error, _message}
      V.validate("awww%", "%")
      V.validate("wwwq", "_")
  """
  @spec consonant(String.t, String.t) :: Validation.default
  def consonant(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Consonant.validate(input, excluded_characters)
  end

  @doc """
  Validates whether the input is even.

      # {:ok}
      V.validate(0)
      V.validate(2)
      V.validate(4)
      V.validate(-2)
      V.validate(9999998)

      # {:error, _message}
      V.validate(1)
      V.validate(5)
      V.validate(-3)
      V.validate(9999999)
  """
  @spec even(Integer.t) :: Validation.default
  def even(input) when is_integer(input) do
    Validation.Rules.Even.validate(input)
  end

  @doc """
  Validates whether the input is lowercase.

      # {:ok}
      V.validate("")
      V.validate("lowercase")
      V.validate("lowercase-with-dashes")
      V.validate("lowercase with spaces")
      V.validate("lowercase with specials characters like ã ç ê")

      # {:error, _message}
      V.validate("UPPERCASE")
      V.validate("CamelCase")
      V.validate("First Character Uppercase")
      V.validate("With Numbers 1 2 3")
  """
  @spec lowercase(String.t) :: Validation.default
  def lowercase(input) when is_binary(input) do
    Validation.Rules.Lowercase.validate(input)
  end

  @doc """
  Validates whether the input is a valid MAC address.

      # {:ok}
      V.validate("00:11:22:33:44:55")
      V.validate("66-77-88-99-aa-bb")
      V.validate("AF:0F:bd:12:44:ba")

      # {:error, _message}
      V.validate("")
      V.validate("00-1122:33:44:55")
  """
  @spec mac_address(String.t) :: default
  def mac_address(input) when is_binary(input) do
    Validation.Rules.MacAddress.validate(input)
  end

  @doc """
  Validates if value is considered as "No".

      # {:ok}
      V.validate("N")
      V.validate("n")
      V.validate("Nay")
      V.validate("No")
      V.validate("Nope")
      V.validate("Not")

      # {:error, _message}
      V.validate("Donnot")
      V.validate("Never")
      V.validate("Niet")
      V.validate("Noooooooo")
      V.validate("Não")
      V.validate("não")
  """
  @spec no(String.t) :: Validation.default
  def no(input) when is_binary(input) do
    Validation.Rules.No.validate(input)
  end

  @doc """
  Validates whether the input is odd.

      # {:ok}
      V.validate(1)
      V.validate(5)
      V.validate(-11)
      V.validate(9999999)

      # {:error, _message}
      V.validate(0)
      V.validate(8)
      V.validate(-100)
      V.validate(9999998)
  """
  @spec odd(Integer.t) :: Validation.default
  def odd(input) when is_integer(input) do
    Validation.Rules.Odd.validate(input)
  end

  @doc """
  Validates whether the input is uppercase.

      # {:ok}
      V.validate("")
      V.validate("UPPERCASE")
      V.validate("UPPERCASE-WITH-DASHES")
      V.validate("UPPERCASE WITH SPACES")
      V.validate("UPPERCASE WITH NUMBERS 123")

      # {:error, _message}
      V.validate("lowercase")
      V.validate("CamelCase")
      V.validate("First Character Uppercase")
      V.validate("With Numbers 1 2 3")
  """
  @spec uppercase(String.t) :: Validation.default
  def uppercase(input) when is_binary(input) do
    Validation.Rules.Uppercase.validate(input)
  end

  @doc """
  Validates whether the input is has only vowels.

      # {:ok}
      V.validate("a")
      V.validate("o")
      V.validate("u")
      V.validate("aeiou")

      # {:error, _message}
      V.validate("b")
      V.validate("ul")
      V.validate("16")
      V.validate("\r")
  """
  @spec vowel(String.t) :: Validation.default
  def vowel(input) when is_binary(input) do
    Validation.Rules.Vowel.validate(input)
  end

  @doc """
  Validates whether the input is has only vowels.

      # {:ok}
      V.validate("aaaa==", "=")
      V.validate("aeoiu!!--", "!-")

      # {:error, _message}
      V.validate("b==aaaa", "=")
      V.validate("bc==aeoiu", "b!-")
  """
  @spec vowel(String.t, String.t) :: Validation.default
  def vowel(input, excluded_characters) when is_binary(input) and is_binary(excluded_characters) do
    Validation.Rules.Vowel.validate(input, excluded_characters)
  end

  @doc """
  Validates if value is considered as "Yes".

      # {:ok}
      V.validate("Y")
      V.validate("Yea")
      V.validate("Yeah")
      V.validate("Yep")
      V.validate("Yes")
      V.validate("yes")

      # {:error, _message}
      V.validate("let's thrown an error")
      V.validate("Yydoesnotmatter")
      V.validate("Si")
      V.validate("Sim")
      V.validate("Yoo")
      V.validate("Yiip")
  """
  @spec yes(String.t) :: Validation.default
  def yes(input) when is_binary(input) do
    Validation.Rules.Yes.validate(input)
  end
end

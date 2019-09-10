defmodule ValidationTest do
  use ExUnit.Case
  alias Validation, as: V
  doctest Validation

  @doc """
  This test has two purposes:
    - Validate documentation: it should reflect the very same values on documentation
    - Validate wrapper: the validation module is just a wrapper, and it should also
    test in order to make sure the API works as expected.
  """
  test "valid documentation" do
    # alpha/1
    assert {:ok} = V.alpha("")
    assert {:ok} = V.alpha("a")
    assert {:ok} = V.alpha("john")
    assert {:ok} = V.alpha("doe")
    assert {:ok} = V.alpha("foobar")

    assert {:error, _} = V.alpha("123")
    assert {:error, _} = V.alpha("number 100%")
    assert {:error, _} = V.alpha("@#$")
    assert {:error, _} = V.alpha("_")
    assert {:error, _} = V.alpha("dgç")



    # alpha/2
    assert {:ok} = V.alpha("john_", "_")
    assert {:ok} = V.alpha("google.com", ".")
    assert {:ok} = V.alpha("john doe", " ")

    assert {:error, _} = V.alpha("john_123", "$")
    assert {:error, _} = V.alpha("google.com321", "*")
    assert {:error, _} = V.alpha("john doe1", "_")



    # alphanumeric/1
    assert {:ok} = V.alphanumeric("foo123");
    assert {:ok} = V.alphanumeric("100number");

    assert {:error, _} = V.alphanumeric("number 100%");
    assert {:error, _} = V.alphanumeric("foo_bar");



    # alphanumeric/2
    assert {:ok} = V.alphanumeric("foo 123", " ");
    assert {:ok} = V.alphanumeric("foo_123", "_");

    assert {:error, _} = V.alphanumeric("number 100%", "%");
    assert {:error, _} = V.alphanumeric("foo_bar", "%");




    # between
    assert {:ok} = V.between(15, 10, 20)
    assert {:ok} = V.between(70, 0, 100)

    assert {:error, _} = V.between(15, 20, 30)
    assert {:error, _} = V.between(70, 300, 999)



    # cnh
    assert {:ok} = V.cnh("02650306461")
    assert {:ok} = V.cnh("04397322870")
    assert {:ok} = V.cnh("04375701302")
    assert {:ok} = V.cnh("02996843266")
    assert {:ok} = V.cnh("04375700501")

    assert {:error, _} = V.cnh("")
    assert {:error, _} = V.cnh("0000000000")
    assert {:error, _} = V.cnh("9999999999")
    assert {:error, _} = V.cnh("0265131640")
    assert {:error, _} = V.cnh("0439732280")



    # cnpj
    assert {:ok} = V.cnpj("32.063.364/0001-07")
    assert {:ok} = V.cnpj("27.355.204/0001-00")
    assert {:ok} = V.cnpj("36.310.327/0001-07")
    assert {:ok} = V.cnpj("37550610000179")
    assert {:ok} = V.cnpj("12774546000189")

    assert {:error, _} = V.cnpj("12.345.678/9012-34")
    assert {:error, _} = V.cnpj("11.111.111111-11")
    assert {:error, _} = V.cnpj("00000000000000")
    assert {:error, _} = V.cnpj("99-010-0.")



    # cpf
    assert {:ok} = V.cpf("350.45261819")
    assert {:ok} = V.cpf("693-319-118-40")
    assert {:ok} = V.cpf("11598647644")
    assert {:ok} = V.cpf("86734718697")
    assert {:ok} = V.cpf("3.6.8.8.9.2.5.5.4.8.8")

    assert {:error, _} = V.cpf("")
    assert {:error, _} = V.cpf("01234567890")
    assert {:error, _} = V.cpf("000.000.000-00")
    assert {:error, _} = V.cpf("111.222.444-05")
    assert {:error, _} = V.cpf("999999999.99")
    assert {:error, _} = V.cpf("8.8.8.8.8.8.8.8.8.8.8")
    assert {:error, _} = V.cpf("693-319-110-40")



    # consonant/1
    assert {:ok} = V.consonant("w")
    assert {:ok} = V.consonant("y")
    assert {:ok} = V.consonant("qrst")
    assert {:ok} = V.consonant("bcdfghklmnp")

    assert {:error, _} = V.consonant("a")
    assert {:error, _} = V.consonant("ul")
    assert {:error, _} = V.consonant("aeiou")
    assert {:error, _} = V.consonant("Foo")



    # consonant/2
    assert {:ok} = V.consonant("www%", "%")
    assert {:ok} = V.consonant("bcd_fgh", "_")
    assert {:ok} = V.consonant("www www__www", " _")

    assert {:error, _} = V.consonant("awww%", "%")
    assert {:error, _} = V.consonant("uwwwq", "_")



    # even
    assert {:ok} = V.even(0)
    assert {:ok} = V.even(2)
    assert {:ok} = V.even(4)
    assert {:ok} = V.even(-2)
    assert {:ok} = V.even(9999998)

    assert {:error, _} = V.even(1)
    assert {:error, _} = V.even(5)
    assert {:error, _} = V.even(-3)
    assert {:error, _} = V.even(9999999)



    # lowercase
    assert {:ok} = V.lowercase("")
    assert {:ok} = V.lowercase("lowercase")
    assert {:ok} = V.lowercase("lowercase-with-dashes")
    assert {:ok} = V.lowercase("lowercase with spaces")
    assert {:ok} = V.lowercase("lowercase with specials characters like ã ç ê")

    assert {:error, _} = V.lowercase("UPPERCASE")
    assert {:error, _} = V.lowercase("CamelCase")
    assert {:error, _} = V.lowercase("First Character Uppercase")
    assert {:error, _} = V.lowercase("With Numbers 1 2 3")



    # mac_address
    assert {:ok} = V.mac_address("00:11:22:33:44:55")
    assert {:ok} = V.mac_address("66-77-88-99-aa-bb")
    assert {:ok} = V.mac_address("AF:0F:bd:12:44:ba")

    assert {:error, _} = V.mac_address("")
    assert {:error, _} = V.mac_address("00-1122:33:44:55")



    # no
    assert {:ok} = V.no("N")
    assert {:ok} = V.no("n")
    assert {:ok} = V.no("Nay")
    assert {:ok} = V.no("No")
    assert {:ok} = V.no("Nope")
    assert {:ok} = V.no("Not")

    assert {:error, _} = V.no("Donnot")
    assert {:error, _} = V.no("Never")
    assert {:error, _} = V.no("Niet")
    assert {:error, _} = V.no("Noooooooo")
    assert {:error, _} = V.no("Não")
    assert {:error, _} = V.no("não")



    # odd
    assert {:ok} = V.odd(1)
    assert {:ok} = V.odd(5)
    assert {:ok} = V.odd(-11)
    assert {:ok} = V.odd(9999999)

    assert {:error, _} = V.odd(0)
    assert {:error, _} = V.odd(8)
    assert {:error, _} = V.odd(-100)
    assert {:error, _} = V.odd(9999998)



    # uppercase
    assert {:ok} = V.uppercase("")
    assert {:ok} = V.uppercase("UPPERCASE")
    assert {:ok} = V.uppercase("UPPERCASE-WITH-DASHES")
    assert {:ok} = V.uppercase("UPPERCASE WITH SPACES")
    assert {:ok} = V.uppercase("UPPERCASE WITH NUMBERS 123")

    assert {:error, _} = V.uppercase("lowercase")
    assert {:error, _} = V.uppercase("CamelCase")
    assert {:error, _} = V.uppercase("First Character Uppercase")
    assert {:error, _} = V.uppercase("With Numbers 1 2 3")



    # vowel/1
    assert {:ok} = V.vowel("a")
    assert {:ok} = V.vowel("o")
    assert {:ok} = V.vowel("u")
    assert {:ok} = V.vowel("aeiou")

    assert {:error, _} = V.vowel("b")
    assert {:error, _} = V.vowel("ul")
    assert {:error, _} = V.vowel("16")
    assert {:error, _} = V.vowel("\r")



    # vowel/2
    assert {:ok} = V.vowel("aaaa==", "=")
    assert {:ok} = V.vowel("aeoiu!!--", "!-")

    assert {:error, _} = V.vowel("b==aaaa", "=")
    assert {:error, _} = V.vowel("bc==aeoiu", "b!-")



    # yes
    assert {:ok} = V.yes("Y")
    assert {:ok} = V.yes("Yea")
    assert {:ok} = V.yes("Yeah")
    assert {:ok} = V.yes("Yep")
    assert {:ok} = V.yes("Yes")
    assert {:ok} = V.yes("yes")

    assert {:error, _} = V.yes("let's thrown an error")
    assert {:error, _} = V.yes("Yydoesnotmatter")
    assert {:error, _} = V.yes("Si")
    assert {:error, _} = V.yes("Sim")
    assert {:error, _} = V.yes("Yoo")
    assert {:error, _} = V.yes("Yiip")
  end
end

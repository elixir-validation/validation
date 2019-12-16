defmodule ValidationTest do
  use ExUnit.Case
  alias Validation, as: V
  doctest Validation

  @doc """
  This test has two purposes:

  1) Validate documentation: it should reflect the very same values on documentation

  2) Validate wrapper: the validation module is just a wrapper to the rules,
  and it should also be covered by tests, in order to make sure the API works as expected.
  But keep in mind that the main tests are not found here.
  """
  test "validate documentation and wrappers" do
    # alpha/1
    assert V.alpha?("")
    assert V.alpha?("a")
    assert V.alpha?("john")
    assert V.alpha?("doe")
    assert V.alpha?("foobar")

    refute V.alpha?("123")
    refute V.alpha?("number 100%")
    refute V.alpha?("@#$")
    refute V.alpha?("_")
    refute V.alpha?("dgç")

    # alpha/2
    assert V.alpha?("john_", "_")
    assert V.alpha?("google.com", ".")
    assert V.alpha?("john doe", " ")

    refute V.alpha?("john_123", "$")
    refute V.alpha?("google.com321", "*")
    refute V.alpha?("john doe1", "_")

    # alphanumeric/1
    assert V.alphanumeric?("foo123")
    assert V.alphanumeric?("100number")

    refute V.alphanumeric?("number 100%")
    refute V.alphanumeric?("foo_bar")

    # alphanumeric/2
    assert V.alphanumeric?("foo 123", " ")
    assert V.alphanumeric?("foo_123", "_")

    refute V.alphanumeric?("number 100%", "%")
    refute V.alphanumeric?("foo_bar", "%")

    # between
    assert V.between?(15, 10, 20)
    assert V.between?(70, 0, 100)

    refute V.between?(15, 20, 30)
    refute V.between?(70, 300, 999)

    # cnh
    assert V.cnh?("02650306461")
    assert V.cnh?("04397322870")
    assert V.cnh?("04375701302")
    assert V.cnh?("02996843266")
    assert V.cnh?("04375700501")

    refute V.cnh?("")
    refute V.cnh?("0000000000")
    refute V.cnh?("9999999999")
    refute V.cnh?("0265131640")
    refute V.cnh?("0439732280")

    # cnpj
    assert V.cnpj?("32.063.364/0001-07")
    assert V.cnpj?("27.355.204/0001-00")
    assert V.cnpj?("36.310.327/0001-07")
    assert V.cnpj?("37550610000179")
    assert V.cnpj?("12774546000189")

    refute V.cnpj?("12.345.678/9012-34")
    refute V.cnpj?("11.111.111111-11")
    refute V.cnpj?("00000000000000")
    refute V.cnpj?("99-010-0.")

    # country code
    assert V.country_code?("BR", :alpha2)
    assert V.country_code?("BRA", :alpha3)
    assert V.country_code?("US", :alpha2)
    assert V.country_code?("USA", :alpha3)
    assert V.country_code?("DE", :alpha2)
    assert V.country_code?("DEU", :alpha3)
    assert V.country_code?("076", :numeric)

    assert_raise RuntimeError,
                 "Invalid type param. It should be either: :alpha2, :alpha3 or :numeric.",
                 fn ->
                   V.country_code?("BRAAAA", :unknown_type)
                 end

    # cpf
    assert V.cpf?("350.45261819")
    assert V.cpf?("693-319-118-40")
    assert V.cpf?("11598647644")
    assert V.cpf?("86734718697")
    assert V.cpf?("3.6.8.8.9.2.5.5.4.8.8")

    refute V.cpf?("")
    refute V.cpf?("01234567890")
    refute V.cpf?("000.000.000-00")
    refute V.cpf?("111.222.444-05")
    refute V.cpf?("999999999.99")
    refute V.cpf?("8.8.8.8.8.8.8.8.8.8.8")
    refute V.cpf?("693-319-110-40")

    # credit_card
    assert V.credit_card?("2223000048400011")
    assert V.credit_card?("2222 4000 4124 0011")
    assert V.credit_card?("4024.0071.5336.1885")

    refute V.credit_card?("it isnt my credit c)ard number")
    refute V.credit_card?("1234 1234 1234 1234")
    refute V.credit_card?("1234.1234.1234.12__34")

    # credit_card_amex
    assert V.credit_card_amex?("340-3161-9380-9364")

    refute V.credit_card_amex?("5376 7473 9720 8720")
    refute V.credit_card_amex?("4024.0071.5336.1885")

    # credit_card_diners
    assert V.credit_card_diners?("30351042633884")

    refute V.credit_card_diners?("5376 7473 9720 8720")
    refute V.credit_card_diners?("4024.0071.5336.1885")

    # credit_card_discover
    assert V.credit_card_discover?("6011000990139424")

    refute V.credit_card_discover?("5376 7473 9720 8720")
    refute V.credit_card_discover?("4024.0071.5336.1885")

    # credit_card_jcb
    assert V.credit_card_jcb?("3566002020360505")

    refute V.credit_card_jcb?("5376 7473 9720 8720")
    refute V.credit_card_jcb?("4024.0071.5336.1885")

    # credit_card_master
    assert V.credit_card_master?("5376 7473 9720 8720")

    refute V.credit_card_master?("340-3161-9380-9364")
    refute V.credit_card_master?("4024.0071.5336.1885")

    # credit_card_visa
    assert V.credit_card_visa?("4024 007 193 879")
    assert V.credit_card_visa?("4024.0071.5336.1885")

    refute V.credit_card_visa?("340-3161-9380-9364")
    refute V.credit_card_visa?("5376 7473 9720 8720")

    # currency_code
    assert V.currency_code?("USD")
    assert V.currency_code?("EUR")
    assert V.currency_code?("GBP")

    refute V.currency_code?("QQQ")
    refute V.currency_code?("2---1")
    refute V.currency_code?("nope")

    # consonant/1
    assert V.consonant?("w")
    assert V.consonant?("y")
    assert V.consonant?("qrst")
    assert V.consonant?("bcdfghklmnp")

    refute V.consonant?("a")
    refute V.consonant?("ul")
    refute V.consonant?("aeiou")
    refute V.consonant?("Foo")

    # consonant/2
    assert V.consonant?("www%", "%")
    assert V.consonant?("bcd_fgh", "_")
    assert V.consonant?("www www__www", " _")

    refute V.consonant?("awww%", "%")
    refute V.consonant?("uwwwq", "_")

    # digit/1
    assert V.digit?("165")
    assert V.digit?("01650")
    assert V.digit?("01")

    refute V.digit?("")
    refute V.digit?("-1.1")
    refute V.digit?("-12")
    refute V.digit?("1.0")

    # digit/2
    assert V.digit?("1.0", ".")
    assert V.digit?("16-50", "-")

    refute V.digit?("")
    refute V.digit?("1.%0", ".")
    refute V.digit?("3333316-5.0/", "-.")

    # email
    assert V.email?("john@gmail.com")
    assert V.email?("hello+world@mydomain.com")
    assert V.email?("mail.email@foo.bar.com")

    refute V.email?("plainaddress")
    refute V.email?("#@%^%#$@#$@#.com")
    refute V.email?("test@test.com.")
    refute V.email?(".test@test.com")
    refute V.email?("@domain.com")

    # luhn
    assert V.luhn?("9773725370")
    assert V.luhn?("2222400041240011")
    assert V.luhn?("340316193809364")

    refute V.luhn?("")
    refute V.luhn?("true")
    refute V.luhn?("8888888888888887")

    # even
    assert V.even?(0)
    assert V.even?(2)
    assert V.even?(4)
    assert V.even?(-2)
    assert V.even?(9_999_998)

    refute V.even?(1)
    refute V.even?(5)
    refute V.even?(-3)
    refute V.even?(9_999_999)

    # language_code
    V.language_code?("en", :alpha2)
    V.language_code?("pt", :alpha2)
    V.language_code?("it", :alpha2)
    V.language_code?("eng", :alpha3)
    V.language_code?("por", :alpha3)
    V.language_code?("ita", :alpha3)

    V.language_code?("hi", :alpha2)
    V.language_code?("foo", :alpha3)

    # lowercase
    assert V.lowercase?("")
    assert V.lowercase?("lowercase")
    assert V.lowercase?("lowercase-with-dashes")
    assert V.lowercase?("lowercase with spaces")
    assert V.lowercase?("lowercase with specials characters like ã ç ê")

    refute V.lowercase?("UPPERCASE")
    refute V.lowercase?("CamelCase")
    refute V.lowercase?("First Character Uppercase")
    refute V.lowercase?("With Numbers 1 2 3")

    # mac_address
    assert V.mac_address?("00:11:22:33:44:55")
    assert V.mac_address?("66-77-88-99-aa-bb")
    assert V.mac_address?("AF:0F:bd:12:44:ba")

    refute V.mac_address?("")
    refute V.mac_address?("00-1122:33:44:55")

    # no
    assert V.no?("N")
    assert V.no?("n")
    assert V.no?("Nay")
    assert V.no?("No")
    assert V.no?("Nope")
    assert V.no?("Not")

    refute V.no?("Donnot")
    refute V.no?("Never")
    refute V.no?("Niet")
    refute V.no?("Noooooooo")
    refute V.no?("Não")
    refute V.no?("não")

    # odd
    assert V.odd?(1)
    assert V.odd?(5)
    assert V.odd?(-11)
    assert V.odd?(9_999_999)

    refute V.odd?(0)
    refute V.odd?(8)
    refute V.odd?(-100)
    refute V.odd?(9_999_998)

    # tld
    V.tld?("com")
    V.tld?("br")
    V.tld?("cafe")
    V.tld?("democrat")

    V.tld?("1.0")
    V.tld?("wrongtld")

    # uppercase
    assert V.uppercase?("")
    assert V.uppercase?("UPPERCASE")
    assert V.uppercase?("UPPERCASE-WITH-DASHES")
    assert V.uppercase?("UPPERCASE WITH SPACES")
    assert V.uppercase?("UPPERCASE WITH NUMBERS 123")

    refute V.uppercase?("lowercase")
    refute V.uppercase?("CamelCase")
    refute V.uppercase?("First Character Uppercase")
    refute V.uppercase?("With Numbers 1 2 3")

    # uuid
    assert V.uuid?("e4eaaaf2-d142-11e1-b3e4-080027620cdd")
    assert V.uuid?("11a38b9a-b3da-360f-9353-a5a725514269")
    assert V.uuid?("25769c6c-d34d-4bfe-ba98-e0ee856f3e7a", 4)

    refute V.uuid?("00000000-0000-aaaa-bbbb-cccccccccccc")

    # subdivision_code
    V.subdivision_code?("US", "TX")
    V.subdivision_code?("BR", "SP")
    V.subdivision_code?("CA", "BC")

    V.subdivision_code?("US", "AA")
    V.subdivision_code?("BR", "BB")
    V.subdivision_code?("CA", "CC")

    # vowel/1
    assert V.vowel?("a")
    assert V.vowel?("o")
    assert V.vowel?("u")
    assert V.vowel?("aeiou")

    refute V.vowel?("b")
    refute V.vowel?("ul")
    refute V.vowel?("16")
    refute V.vowel?("\r")

    # vowel/2
    assert V.vowel?("aaaa==", "=")
    assert V.vowel?("aeoiu!!--", "!-")

    refute V.vowel?("b==aaaa", "=")
    refute V.vowel?("bc==aeoiu", "b!-")

    # yes
    assert V.yes?("Y")
    assert V.yes?("Yea")
    assert V.yes?("Yeah")
    assert V.yes?("Yep")
    assert V.yes?("Yes")
    assert V.yes?("yes")

    refute V.yes?("let's thrown an error")
    refute V.yes?("Yydoesnotmatter")
    refute V.yes?("Si")
    refute V.yes?("Sim")
    refute V.yes?("Yoo")
    refute V.yes?("Yiip")
  end
end

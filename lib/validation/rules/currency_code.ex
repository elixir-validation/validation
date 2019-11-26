defmodule Validation.Rules.CurrencyCode do
  @moduledoc false

  @currency_codes [
    # Afghani
    "AFN",
    # Euro
    "EUR",
    # Lek
    "ALL",
    # Algerian Dinar
    "DZD",
    # US Dollar
    "USD",
    # Euro
    "EUR",
    # Kwanza
    "AOA",
    # East Caribbean Dollar
    "XCD",
    # East Caribbean Dollar
    "XCD",
    # Argentine Peso
    "ARS",
    # Armenian Dram
    "AMD",
    # Aruban Florin
    "AWG",
    # Australian Dollar
    "AUD",
    # Euro
    "EUR",
    # Azerbaijan Manat
    "AZN",
    # Bahamian Dollar
    "BSD",
    # Bahraini Dinar
    "BHD",
    # Taka
    "BDT",
    # Barbados Dollar
    "BBD",
    # Belarusian Ruble
    "BYN",
    # Euro
    "EUR",
    # Belize Dollar
    "BZD",
    # CFA Franc BCEAO
    "XOF",
    # Bermudian Dollar
    "BMD",
    # Indian Rupee
    "INR",
    # Ngultrum
    "BTN",
    # Boliviano
    "BOB",
    # Mvdol
    "BOV",
    # US Dollar
    "USD",
    # Convertible Mark
    "BAM",
    # Pula
    "BWP",
    # Norwegian Krone
    "NOK",
    # Brazilian Real
    "BRL",
    # US Dollar
    "USD",
    # Brunei Dollar
    "BND",
    # Bulgarian Lev
    "BGN",
    # CFA Franc BCEAO
    "XOF",
    # Burundi Franc
    "BIF",
    # Cabo Verde Escudo
    "CVE",
    # Riel
    "KHR",
    # CFA Franc BEAC
    "XAF",
    # Canadian Dollar
    "CAD",
    # Cayman Islands Dollar
    "KYD",
    # CFA Franc BEAC
    "XAF",
    # CFA Franc BEAC
    "XAF",
    # Chilean Peso
    "CLP",
    # Unidad de Fomento
    "CLF",
    # Yuan Renminbi
    "CNY",
    # Australian Dollar
    "AUD",
    # Australian Dollar
    "AUD",
    # Colombian Peso
    "COP",
    # Unidad de Valor Real
    "COU",
    # Comorian Franc
    "KMF",
    # Congolese Franc
    "CDF",
    # CFA Franc BEAC
    "XAF",
    # New Zealand Dollar
    "NZD",
    # Costa Rican Colon
    "CRC",
    # CFA Franc BCEAO
    "XOF",
    # Kuna
    "HRK",
    # Cuban Peso
    "CUP",
    # Peso Convertible
    "CUC",
    # Netherlands Antillean Guilder
    "ANG",
    # Euro
    "EUR",
    # Czech Koruna
    "CZK",
    # Danish Krone
    "DKK",
    # Djibouti Franc
    "DJF",
    # East Caribbean Dollar
    "XCD",
    # Dominican Peso
    "DOP",
    # US Dollar
    "USD",
    # Egyptian Pound
    "EGP",
    # El Salvador Colon
    "SVC",
    # US Dollar
    "USD",
    # CFA Franc BEAC
    "XAF",
    # Nakfa
    "ERN",
    # Euro
    "EUR",
    # Ethiopian Birr
    "ETB",
    # Euro
    "EUR",
    # Falkland Islands Pound
    "FKP",
    # Danish Krone
    "DKK",
    # Fiji Dollar
    "FJD",
    # Euro
    "EUR",
    # Euro
    "EUR",
    # Euro
    "EUR",
    # CFP Franc
    "XPF",
    # Euro
    "EUR",
    # CFA Franc BEAC
    "XAF",
    # Dalasi
    "GMD",
    # Lari
    "GEL",
    # Euro
    "EUR",
    # Ghana Cedi
    "GHS",
    # Gibraltar Pound
    "GIP",
    # Euro
    "EUR",
    # Danish Krone
    "DKK",
    # East Caribbean Dollar
    "XCD",
    # Euro
    "EUR",
    # US Dollar
    "USD",
    # Quetzal
    "GTQ",
    # Pound Sterling
    "GBP",
    # Guinean Franc
    "GNF",
    # CFA Franc BCEAO
    "XOF",
    # Guyana Dollar
    "GYD",
    # Gourde
    "HTG",
    # US Dollar
    "USD",
    # Australian Dollar
    "AUD",
    # Euro
    "EUR",
    # Lempira
    "HNL",
    # Hong Kong Dollar
    "HKD",
    # Forint
    "HUF",
    # Iceland Krona
    "ISK",
    # Indian Rupee
    "INR",
    # Rupiah
    "IDR",
    # SDR (Special Drawing Right)
    "XDR",
    # Iranian Rial
    "IRR",
    # Iraqi Dinar
    "IQD",
    # Euro
    "EUR",
    # Pound Sterling
    "GBP",
    # New Israeli Sheqel
    "ILS",
    # Euro
    "EUR",
    # Jamaican Dollar
    "JMD",
    # Yen
    "JPY",
    # Pound Sterling
    "GBP",
    # Jordanian Dinar
    "JOD",
    # Tenge
    "KZT",
    # Kenyan Shilling
    "KES",
    # Australian Dollar
    "AUD",
    # North Korean Won
    "KPW",
    # Won
    "KRW",
    # Kuwaiti Dinar
    "KWD",
    # Som
    "KGS",
    # Lao Kip
    "LAK",
    # Euro
    "EUR",
    # Lebanese Pound
    "LBP",
    # Loti
    "LSL",
    # Rand
    "ZAR",
    # Liberian Dollar
    "LRD",
    # Libyan Dinar
    "LYD",
    # Swiss Franc
    "CHF",
    # Euro
    "EUR",
    # Euro
    "EUR",
    # Pataca
    "MOP",
    # Denar
    "MKD",
    # Malagasy Ariary
    "MGA",
    # Malawi Kwacha
    "MWK",
    # Malaysian Ringgit
    "MYR",
    # Rufiyaa
    "MVR",
    # CFA Franc BCEAO
    "XOF",
    # Euro
    "EUR",
    # US Dollar
    "USD",
    # Euro
    "EUR",
    # Ouguiya
    "MRU",
    # Mauritius Rupee
    "MUR",
    # Euro
    "EUR",
    # ADB Unit of Account
    "XUA",
    # Mexican Peso
    "MXN",
    # Mexican Unidad de Inversion (UDI)
    "MXV",
    # US Dollar
    "USD",
    # Moldovan Leu
    "MDL",
    # Euro
    "EUR",
    # Tugrik
    "MNT",
    # Euro
    "EUR",
    # East Caribbean Dollar
    "XCD",
    # Moroccan Dirham
    "MAD",
    # Mozambique Metical
    "MZN",
    # Kyat
    "MMK",
    # Namibia Dollar
    "NAD",
    # Rand
    "ZAR",
    # Australian Dollar
    "AUD",
    # Nepalese Rupee
    "NPR",
    # Euro
    "EUR",
    # CFP Franc
    "XPF",
    # New Zealand Dollar
    "NZD",
    # Cordoba Oro
    "NIO",
    # CFA Franc BCEAO
    "XOF",
    # Naira
    "NGN",
    # New Zealand Dollar
    "NZD",
    # Australian Dollar
    "AUD",
    # US Dollar
    "USD",
    # Norwegian Krone
    "NOK",
    # Rial Omani
    "OMR",
    # Pakistan Rupee
    "PKR",
    # US Dollar
    "USD",
    # Balboa
    "PAB",
    # US Dollar
    "USD",
    # Kina
    "PGK",
    # Guarani
    "PYG",
    # Sol
    "PEN",
    # Philippine Peso
    "PHP",
    # New Zealand Dollar
    "NZD",
    # Zloty
    "PLN",
    # Euro
    "EUR",
    # US Dollar
    "USD",
    # Qatari Rial
    "QAR",
    # Euro
    "EUR",
    # Romanian Leu
    "RON",
    # Russian Ruble
    "RUB",
    # Rwanda Franc
    "RWF",
    # Euro
    "EUR",
    # Saint Helena Pound
    "SHP",
    # East Caribbean Dollar
    "XCD",
    # East Caribbean Dollar
    "XCD",
    # Euro
    "EUR",
    # Euro
    "EUR",
    # East Caribbean Dollar
    "XCD",
    # Tala
    "WST",
    # Euro
    "EUR",
    # Dobra
    "STN",
    # Saudi Riyal
    "SAR",
    # CFA Franc BCEAO
    "XOF",
    # Serbian Dinar
    "RSD",
    # Seychelles Rupee
    "SCR",
    # Leone
    "SLL",
    # Singapore Dollar
    "SGD",
    # Netherlands Antillean Guilder
    "ANG",
    # Sucre
    "XSU",
    # Euro
    "EUR",
    # Euro
    "EUR",
    # Solomon Islands Dollar
    "SBD",
    # Somali Shilling
    "SOS",
    # Rand
    "ZAR",
    # South Sudanese Pound
    "SSP",
    # Euro
    "EUR",
    # Sri Lanka Rupee
    "LKR",
    # Sudanese Pound
    "SDG",
    # Surinam Dollar
    "SRD",
    # Norwegian Krone
    "NOK",
    # Lilangeni
    "SZL",
    # Swedish Krona
    "SEK",
    # Swiss Franc
    "CHF",
    # WIR Euro
    "CHE",
    # WIR Franc
    "CHW",
    # Syrian Pound
    "SYP",
    # New Taiwan Dollar
    "TWD",
    # Somoni
    "TJS",
    # Tanzanian Shilling
    "TZS",
    # Baht
    "THB",
    # US Dollar
    "USD",
    # CFA Franc BCEAO
    "XOF",
    # New Zealand Dollar
    "NZD",
    # Pa’anga
    "TOP",
    # Trinidad and Tobago Dollar
    "TTD",
    # Tunisian Dinar
    "TND",
    # Turkish Lira
    "TRY",
    # Turkmenistan New Manat
    "TMT",
    # US Dollar
    "USD",
    # Australian Dollar
    "AUD",
    # Uganda Shilling
    "UGX",
    # Hryvnia
    "UAH",
    # UAE Dirham
    "AED",
    # Pound Sterling
    "GBP",
    # US Dollar
    "USD",
    # US Dollar
    "USD",
    # US Dollar (Next day)
    "USN",
    # Peso Uruguayo
    "UYU",
    # Uruguay Peso en Unidades Indexadas (UI)
    "UYI",
    # Unidad Previsional
    "UYW",
    # Uzbekistan Sum
    "UZS",
    # Vatu
    "VUV",
    # Bolívar Soberano
    "VES",
    # Dong
    "VND",
    # US Dollar
    "USD",
    # US Dollar
    "USD",
    # CFP Franc
    "XPF",
    # Moroccan Dirham
    "MAD",
    # Yemeni Rial
    "YER",
    # Zambian Kwacha
    "ZMW",
    # Zimbabwe Dollar
    "ZWL",
    # Bond Markets Unit European Composite Unit (EURCO)
    "XBA",
    # Bond Markets Unit European Monetary Unit (E.M.U.-6)
    "XBB",
    # Bond Markets Unit European Unit of Account 9 (E.U.A.-9)
    "XBC",
    # Bond Markets Unit European Unit of Account 17 (E.U.A.-17)
    "XBD",
    # Codes specifically reserved for testing purposes
    "XTS",
    # The codes assigned for transactions where no currency is involved
    "XXX",
    # Gold
    "XAU",
    # Palladium
    "XPD",
    # Platinum
    "XPT",
    # Silver
    "XAG"
  ]

  @spec validate?(String.t()) :: boolean
  def validate?(input) when is_binary(input) do
    Enum.member?(@currency_codes, input)
  end
end

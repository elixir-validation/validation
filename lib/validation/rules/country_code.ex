defmodule Validation.Rules.CountryCode do
  @moduledoc false

  @country_codes [
    %{:alpha2 => "AD", :alpha3 => "AND", :numeric => "020"}, # Andorra
    %{:alpha2 => "AE", :alpha3 => "ARE", :numeric => "784"}, # United Arab Emirates
    %{:alpha2 => "AF", :alpha3 => "AFG", :numeric => "004"}, # Afghanistan
    %{:alpha2 => "AG", :alpha3 => "ATG", :numeric => "028"}, # Antigua and Barbuda
    %{:alpha2 => "AI", :alpha3 => "AFI", :numeric => "262"}, # French Afars and Issas
    %{:alpha2 => "AI", :alpha3 => "AIA", :numeric => "660"}, # Anguilla
    %{:alpha2 => "AL", :alpha3 => "ALB", :numeric => "008"}, # Albania
    %{:alpha2 => "AM", :alpha3 => "ARM", :numeric => "051"}, # Armenia
    %{:alpha2 => "AN", :alpha3 => "ANT", :numeric => "530"}, # Netherlands Antilles
    %{:alpha2 => "AO", :alpha3 => "AGO", :numeric => "024"}, # Angola
    %{:alpha2 => "AQ", :alpha3 => "ATA", :numeric => "010"}, # Antarctica
    %{:alpha2 => "AR", :alpha3 => "ARG", :numeric => "032"}, # Argentina
    %{:alpha2 => "AS", :alpha3 => "ASM", :numeric => "016"}, # American Samoa
    %{:alpha2 => "AT", :alpha3 => "AUT", :numeric => "040"}, # Austria
    %{:alpha2 => "AU", :alpha3 => "AUS", :numeric => "036"}, # Australia
    %{:alpha2 => "AW", :alpha3 => "ABW", :numeric => "533"}, # Aruba
    %{:alpha2 => "AX", :alpha3 => "ALA", :numeric => "248"}, # Åland Islands
    %{:alpha2 => "AZ", :alpha3 => "AZE", :numeric => "031"}, # Azerbaijan
    %{:alpha2 => "BA", :alpha3 => "BIH", :numeric => "070"}, # Bosnia and Herzegovina
    %{:alpha2 => "BB", :alpha3 => "BRB", :numeric => "052"}, # Barbados
    %{:alpha2 => "BD", :alpha3 => "BGD", :numeric => "050"}, # Bangladesh
    %{:alpha2 => "BE", :alpha3 => "BEL", :numeric => "056"}, # Belgium
    %{:alpha2 => "BF", :alpha3 => "BFA", :numeric => "854"}, # Burkina Faso
    %{:alpha2 => "BG", :alpha3 => "BGR", :numeric => "100"}, # Bulgaria
    %{:alpha2 => "BH", :alpha3 => "BHR", :numeric => "048"}, # Bahrain
    %{:alpha2 => "BI", :alpha3 => "BDI", :numeric => "108"}, # Burundi
    %{:alpha2 => "BJ", :alpha3 => "BEN", :numeric => "204"}, # Benin
    %{:alpha2 => "BL", :alpha3 => "BLM", :numeric => "652"}, # Saint Barthélemy
    %{:alpha2 => "BM", :alpha3 => "BMU", :numeric => "060"}, # Bermuda
    %{:alpha2 => "BN", :alpha3 => "BRN", :numeric => "096"}, # Brunei Darussalam
    %{:alpha2 => "BO", :alpha3 => "BOL", :numeric => "068"}, # Bolivia, Plurinational State of
    %{:alpha2 => "BQ", :alpha3 => "ATB", :numeric => nil},   # British Antarctic Territory
    %{:alpha2 => "BQ", :alpha3 => "BES", :numeric => "535"}, # Bonaire, Sint Eustatius and Saba
    %{:alpha2 => "BR", :alpha3 => "BRA", :numeric => "076"}, # Brazil
    %{:alpha2 => "BS", :alpha3 => "BHS", :numeric => "044"}, # Bahamas
    %{:alpha2 => "BT", :alpha3 => "BTN", :numeric => "064"}, # Bhutan
    %{:alpha2 => "BU", :alpha3 => "BUR", :numeric => "104"}, # Burma, Socialist Republic of the Union of
    %{:alpha2 => "BV", :alpha3 => "BVT", :numeric => "074"}, # Bouvet Island
    %{:alpha2 => "BW", :alpha3 => "BWA", :numeric => "072"}, # Botswana
    %{:alpha2 => "BY", :alpha3 => "BLR", :numeric => "112"}, # Belarus
    %{:alpha2 => "BY", :alpha3 => "BYS", :numeric => "112"}, # Byelorussian SSR Soviet Socialist Republic
    %{:alpha2 => "BZ", :alpha3 => "BLZ", :numeric => "084"}, # Belize
    %{:alpha2 => "CA", :alpha3 => "CAN", :numeric => "124"}, # Canada
    %{:alpha2 => "CC", :alpha3 => "CCK", :numeric => "166"}, # Cocos (Keeling) Islands
    %{:alpha2 => "CD", :alpha3 => "COD", :numeric => "180"}, # Congo, The Democratic Republic of the
    %{:alpha2 => "CF", :alpha3 => "CAF", :numeric => "140"}, # Central African Republic
    %{:alpha2 => "CG", :alpha3 => "COG", :numeric => "178"}, # Congo
    %{:alpha2 => "CH", :alpha3 => "CHE", :numeric => "756"}, # Switzerland
    %{:alpha2 => "CI", :alpha3 => "CIV", :numeric => "384"}, # Côte d"Ivoire
    %{:alpha2 => "CK", :alpha3 => "COK", :numeric => "184"}, # Cook Islands
    %{:alpha2 => "CL", :alpha3 => "CHL", :numeric => "152"}, # Chile
    %{:alpha2 => "CM", :alpha3 => "CMR", :numeric => "120"}, # Cameroon
    %{:alpha2 => "CN", :alpha3 => "CHN", :numeric => "156"}, # China
    %{:alpha2 => "CO", :alpha3 => "COL", :numeric => "170"}, # Colombia
    %{:alpha2 => "CR", :alpha3 => "CRI", :numeric => "188"}, # Costa Rica
    %{:alpha2 => "CS", :alpha3 => "CSK", :numeric => "200"}, # Czechoslovakia, Czechoslovak Socialist Republic
    %{:alpha2 => "CS", :alpha3 => "SCG", :numeric => "891"}, # Serbia and Montenegro
    %{:alpha2 => "CT", :alpha3 => "CTE", :numeric => "128"}, # Canton and Enderbury Islands
    %{:alpha2 => "CU", :alpha3 => "CUB", :numeric => "192"}, # Cuba
    %{:alpha2 => "CV", :alpha3 => "CPV", :numeric => "132"}, # Cabo Verde
    %{:alpha2 => "CW", :alpha3 => "CUW", :numeric => "531"}, # Curaçao
    %{:alpha2 => "CX", :alpha3 => "CXR", :numeric => "162"}, # Christmas Island
    %{:alpha2 => "CY", :alpha3 => "CYP", :numeric => "196"}, # Cyprus
    %{:alpha2 => "CZ", :alpha3 => "CZE", :numeric => "203"}, # Czechia
    %{:alpha2 => "DD", :alpha3 => "DDR", :numeric => "278"}, # German Democratic Republic
    %{:alpha2 => "DE", :alpha3 => "DEU", :numeric => "276"}, # Germany
    %{:alpha2 => "DJ", :alpha3 => "DJI", :numeric => "262"}, # Djibouti
    %{:alpha2 => "DK", :alpha3 => "DNK", :numeric => "208"}, # Denmark
    %{:alpha2 => "DM", :alpha3 => "DMA", :numeric => "212"}, # Dominica
    %{:alpha2 => "DO", :alpha3 => "DOM", :numeric => "214"}, # Dominican Republic
    %{:alpha2 => "DY", :alpha3 => "DHY", :numeric => "204"}, # Dahomey
    %{:alpha2 => "DZ", :alpha3 => "DZA", :numeric => "012"}, # Algeria
    %{:alpha2 => "EC", :alpha3 => "ECU", :numeric => "218"}, # Ecuador
    %{:alpha2 => "EE", :alpha3 => "EST", :numeric => "233"}, # Estonia
    %{:alpha2 => "EG", :alpha3 => "EGY", :numeric => "818"}, # Egypt
    %{:alpha2 => "EH", :alpha3 => "ESH", :numeric => "732"}, # Western Sahara
    %{:alpha2 => "ER", :alpha3 => "ERI", :numeric => "232"}, # Eritrea
    %{:alpha2 => "ES", :alpha3 => "ESP", :numeric => "724"}, # Spain
    %{:alpha2 => "ET", :alpha3 => "ETH", :numeric => "231"}, # Ethiopia
    %{:alpha2 => "FI", :alpha3 => "FIN", :numeric => "246"}, # Finland
    %{:alpha2 => "FJ", :alpha3 => "FJI", :numeric => "242"}, # Fiji
    %{:alpha2 => "FK", :alpha3 => "FLK", :numeric => "238"}, # Falkland Islands (Malvinas)
    %{:alpha2 => "FM", :alpha3 => "FSM", :numeric => "583"}, # Micronesia, Federated States of
    %{:alpha2 => "FO", :alpha3 => "FRO", :numeric => "234"}, # Faroe Islands
    %{:alpha2 => "FQ", :alpha3 => "ATF", :numeric => nil},   # French Southern and Antarctic Territories
    %{:alpha2 => "FR", :alpha3 => "FRA", :numeric => "250"}, # France
    %{:alpha2 => "FX", :alpha3 => "FXX", :numeric => "249"}, # France, Metropolitan
    %{:alpha2 => "GA", :alpha3 => "GAB", :numeric => "266"}, # Gabon
    %{:alpha2 => "GB", :alpha3 => "GBR", :numeric => "826"}, # United Kingdom
    %{:alpha2 => "GD", :alpha3 => "GRD", :numeric => "308"}, # Grenada
    %{:alpha2 => "GE", :alpha3 => "GEL", :numeric => "296"}, # Gilbert and Ellice Islands
    %{:alpha2 => "GE", :alpha3 => "GEO", :numeric => "268"}, # Georgia
    %{:alpha2 => "GF", :alpha3 => "GUF", :numeric => "254"}, # French Guiana
    %{:alpha2 => "GG", :alpha3 => "GGY", :numeric => "831"}, # Guernsey
    %{:alpha2 => "GH", :alpha3 => "GHA", :numeric => "288"}, # Ghana
    %{:alpha2 => "GI", :alpha3 => "GIB", :numeric => "292"}, # Gibraltar
    %{:alpha2 => "GL", :alpha3 => "GRL", :numeric => "304"}, # Greenland
    %{:alpha2 => "GM", :alpha3 => "GMB", :numeric => "270"}, # Gambia
    %{:alpha2 => "GN", :alpha3 => "GIN", :numeric => "324"}, # Guinea
    %{:alpha2 => "GP", :alpha3 => "GLP", :numeric => "312"}, # Guadeloupe
    %{:alpha2 => "GQ", :alpha3 => "GNQ", :numeric => "226"}, # Equatorial Guinea
    %{:alpha2 => "GR", :alpha3 => "GRC", :numeric => "300"}, # Greece
    %{:alpha2 => "GS", :alpha3 => "SGS", :numeric => "239"}, # South Georgia and the South Sandwich Islands
    %{:alpha2 => "GT", :alpha3 => "GTM", :numeric => "320"}, # Guatemala
    %{:alpha2 => "GU", :alpha3 => "GUM", :numeric => "316"}, # Guam
    %{:alpha2 => "GW", :alpha3 => "GNB", :numeric => "624"}, # Guinea-Bissau
    %{:alpha2 => "GY", :alpha3 => "GUY", :numeric => "328"}, # Guyana
    %{:alpha2 => "HK", :alpha3 => "HKG", :numeric => "344"}, # Hong Kong
    %{:alpha2 => "HM", :alpha3 => "HMD", :numeric => "334"}, # Heard Island and McDonald Islands
    %{:alpha2 => "HN", :alpha3 => "HND", :numeric => "340"}, # Honduras
    %{:alpha2 => "HR", :alpha3 => "HRV", :numeric => "191"}, # Croatia
    %{:alpha2 => "HT", :alpha3 => "HTI", :numeric => "332"}, # Haiti
    %{:alpha2 => "HU", :alpha3 => "HUN", :numeric => "348"}, # Hungary
    %{:alpha2 => "HV", :alpha3 => "HVO", :numeric => "854"}, # Upper Volta, Republic of
    %{:alpha2 => "ID", :alpha3 => "IDN", :numeric => "360"}, # Indonesia
    %{:alpha2 => "IE", :alpha3 => "IRL", :numeric => "372"}, # Ireland
    %{:alpha2 => "IL", :alpha3 => "ISR", :numeric => "376"}, # Israel
    %{:alpha2 => "IM", :alpha3 => "IMN", :numeric => "833"}, # Isle of Man
    %{:alpha2 => "IN", :alpha3 => "IND", :numeric => "356"}, # India
    %{:alpha2 => "IO", :alpha3 => "IOT", :numeric => "086"}, # British Indian Ocean Territory
    %{:alpha2 => "IQ", :alpha3 => "IRQ", :numeric => "368"}, # Iraq
    %{:alpha2 => "IR", :alpha3 => "IRN", :numeric => "364"}, # Iran, Islamic Republic of
    %{:alpha2 => "IS", :alpha3 => "ISL", :numeric => "352"}, # Iceland
    %{:alpha2 => "IT", :alpha3 => "ITA", :numeric => "380"}, # Italy
    %{:alpha2 => "JE", :alpha3 => "JEY", :numeric => "832"}, # Jersey
    %{:alpha2 => "JM", :alpha3 => "JAM", :numeric => "388"}, # Jamaica
    %{:alpha2 => "JO", :alpha3 => "JOR", :numeric => "400"}, # Jordan
    %{:alpha2 => "JP", :alpha3 => "JPN", :numeric => "392"}, # Japan
    %{:alpha2 => "JT", :alpha3 => "JTN", :numeric => "396"}, # Johnston Island
    %{:alpha2 => "KE", :alpha3 => "KEN", :numeric => "404"}, # Kenya
    %{:alpha2 => "KG", :alpha3 => "KGZ", :numeric => "417"}, # Kyrgyzstan
    %{:alpha2 => "KH", :alpha3 => "KHM", :numeric => "116"}, # Cambodia
    %{:alpha2 => "KI", :alpha3 => "KIR", :numeric => "296"}, # Kiribati
    %{:alpha2 => "KM", :alpha3 => "COM", :numeric => "174"}, # Comoros
    %{:alpha2 => "KN", :alpha3 => "KNA", :numeric => "659"}, # Saint Kitts and Nevis
    %{:alpha2 => "KP", :alpha3 => "PRK", :numeric => "408"}, # Korea, Democratic People"s Republic of
    %{:alpha2 => "KR", :alpha3 => "KOR", :numeric => "410"}, # Korea, Republic of
    %{:alpha2 => "KW", :alpha3 => "KWT", :numeric => "414"}, # Kuwait
    %{:alpha2 => "KY", :alpha3 => "CYM", :numeric => "136"}, # Cayman Islands
    %{:alpha2 => "KZ", :alpha3 => "KAZ", :numeric => "398"}, # Kazakhstan
    %{:alpha2 => "LA", :alpha3 => "LAO", :numeric => "418"}, # Lao People"s Democratic Republic
    %{:alpha2 => "LB", :alpha3 => "LBN", :numeric => "422"}, # Lebanon
    %{:alpha2 => "LC", :alpha3 => "LCA", :numeric => "662"}, # Saint Lucia
    %{:alpha2 => "LI", :alpha3 => "LIE", :numeric => "438"}, # Liechtenstein
    %{:alpha2 => "LK", :alpha3 => "LKA", :numeric => "144"}, # Sri Lanka
    %{:alpha2 => "LR", :alpha3 => "LBR", :numeric => "430"}, # Liberia
    %{:alpha2 => "LS", :alpha3 => "LSO", :numeric => "426"}, # Lesotho
    %{:alpha2 => "LT", :alpha3 => "LTU", :numeric => "440"}, # Lithuania
    %{:alpha2 => "LU", :alpha3 => "LUX", :numeric => "442"}, # Luxembourg
    %{:alpha2 => "LV", :alpha3 => "LVA", :numeric => "428"}, # Latvia
    %{:alpha2 => "LY", :alpha3 => "LBY", :numeric => "434"}, # Libya
    %{:alpha2 => "MA", :alpha3 => "MAR", :numeric => "504"}, # Morocco
    %{:alpha2 => "MC", :alpha3 => "MCO", :numeric => "492"}, # Monaco
    %{:alpha2 => "MD", :alpha3 => "MDA", :numeric => "498"}, # Moldova, Republic of
    %{:alpha2 => "ME", :alpha3 => "MNE", :numeric => "499"}, # Montenegro
    %{:alpha2 => "MF", :alpha3 => "MAF", :numeric => "663"}, # Saint Martin (French part)
    %{:alpha2 => "MG", :alpha3 => "MDG", :numeric => "450"}, # Madagascar
    %{:alpha2 => "MH", :alpha3 => "MHL", :numeric => "584"}, # Marshall Islands
    %{:alpha2 => "MI", :alpha3 => "MID", :numeric => "488"}, # Midway Islands
    %{:alpha2 => "MK", :alpha3 => "MKD", :numeric => "807"}, # North Macedonia
    %{:alpha2 => "ML", :alpha3 => "MLI", :numeric => "466"}, # Mali
    %{:alpha2 => "MM", :alpha3 => "MMR", :numeric => "104"}, # Myanmar
    %{:alpha2 => "MN", :alpha3 => "MNG", :numeric => "496"}, # Mongolia
    %{:alpha2 => "MO", :alpha3 => "MAC", :numeric => "446"}, # Macao
    %{:alpha2 => "MP", :alpha3 => "MNP", :numeric => "580"}, # Northern Mariana Islands
    %{:alpha2 => "MQ", :alpha3 => "MTQ", :numeric => "474"}, # Martinique
    %{:alpha2 => "MR", :alpha3 => "MRT", :numeric => "478"}, # Mauritania
    %{:alpha2 => "MS", :alpha3 => "MSR", :numeric => "500"}, # Montserrat
    %{:alpha2 => "MT", :alpha3 => "MLT", :numeric => "470"}, # Malta
    %{:alpha2 => "MU", :alpha3 => "MUS", :numeric => "480"}, # Mauritius
    %{:alpha2 => "MV", :alpha3 => "MDV", :numeric => "462"}, # Maldives
    %{:alpha2 => "MW", :alpha3 => "MWI", :numeric => "454"}, # Malawi
    %{:alpha2 => "MX", :alpha3 => "MEX", :numeric => "484"}, # Mexico
    %{:alpha2 => "MY", :alpha3 => "MYS", :numeric => "458"}, # Malaysia
    %{:alpha2 => "MZ", :alpha3 => "MOZ", :numeric => "508"}, # Mozambique
    %{:alpha2 => "NA", :alpha3 => "NAM", :numeric => "516"}, # Namibia
    %{:alpha2 => "NC", :alpha3 => "NCL", :numeric => "540"}, # New Caledonia
    %{:alpha2 => "NE", :alpha3 => "NER", :numeric => "562"}, # Niger
    %{:alpha2 => "NF", :alpha3 => "NFK", :numeric => "574"}, # Norfolk Island
    %{:alpha2 => "NG", :alpha3 => "NGA", :numeric => "566"}, # Nigeria
    %{:alpha2 => "NH", :alpha3 => "NHB", :numeric => "548"}, # New Hebrides
    %{:alpha2 => "NI", :alpha3 => "NIC", :numeric => "558"}, # Nicaragua
    %{:alpha2 => "NL", :alpha3 => "NLD", :numeric => "528"}, # Netherlands
    %{:alpha2 => "NO", :alpha3 => "NOR", :numeric => "578"}, # Norway
    %{:alpha2 => "NP", :alpha3 => "NPL", :numeric => "524"}, # Nepal
    %{:alpha2 => "NQ", :alpha3 => "ATN", :numeric => "216"}, # Dronning Maud Land
    %{:alpha2 => "NR", :alpha3 => "NRU", :numeric => "520"}, # Nauru
    %{:alpha2 => "NT", :alpha3 => "NTZ", :numeric => "536"}, # Neutral Zone
    %{:alpha2 => "NU", :alpha3 => "NIU", :numeric => "570"}, # Niue
    %{:alpha2 => "NZ", :alpha3 => "NZL", :numeric => "554"}, # New Zealand
    %{:alpha2 => "OM", :alpha3 => "OMN", :numeric => "512"}, # Oman
    %{:alpha2 => "PA", :alpha3 => "PAN", :numeric => "591"}, # Panama
    %{:alpha2 => "PC", :alpha3 => "PCI", :numeric => "582"}, # Pacific Islands (trust territory)
    %{:alpha2 => "PE", :alpha3 => "PER", :numeric => "604"}, # Peru
    %{:alpha2 => "PF", :alpha3 => "PYF", :numeric => "258"}, # French Polynesia
    %{:alpha2 => "PG", :alpha3 => "PNG", :numeric => "598"}, # Papua New Guinea
    %{:alpha2 => "PH", :alpha3 => "PHL", :numeric => "608"}, # Philippines
    %{:alpha2 => "PK", :alpha3 => "PAK", :numeric => "586"}, # Pakistan
    %{:alpha2 => "PL", :alpha3 => "POL", :numeric => "616"}, # Poland
    %{:alpha2 => "PM", :alpha3 => "SPM", :numeric => "666"}, # Saint Pierre and Miquelon
    %{:alpha2 => "PN", :alpha3 => "PCN", :numeric => "612"}, # Pitcairn
    %{:alpha2 => "PR", :alpha3 => "PRI", :numeric => "630"}, # Puerto Rico
    %{:alpha2 => "PS", :alpha3 => "PSE", :numeric => "275"}, # Palestine, State of
    %{:alpha2 => "PT", :alpha3 => "PRT", :numeric => "620"}, # Portugal
    %{:alpha2 => "PU", :alpha3 => "PUS", :numeric => "849"}, # US Miscellaneous Pacific Islands
    %{:alpha2 => "PW", :alpha3 => "PLW", :numeric => "585"}, # Palau
    %{:alpha2 => "PY", :alpha3 => "PRY", :numeric => "600"}, # Paraguay
    %{:alpha2 => "PZ", :alpha3 => "PCZ", :numeric => nil},   # Panama Canal Zone
    %{:alpha2 => "QA", :alpha3 => "QAT", :numeric => "634"}, # Qatar
    %{:alpha2 => "RE", :alpha3 => "REU", :numeric => "638"}, # Réunion
    %{:alpha2 => "RH", :alpha3 => "RHO", :numeric => "716"}, # Southern Rhodesia
    %{:alpha2 => "RO", :alpha3 => "ROU", :numeric => "642"}, # Romania
    %{:alpha2 => "RS", :alpha3 => "SRB", :numeric => "688"}, # Serbia
    %{:alpha2 => "RU", :alpha3 => "RUS", :numeric => "643"}, # Russian Federation
    %{:alpha2 => "RW", :alpha3 => "RWA", :numeric => "646"}, # Rwanda
    %{:alpha2 => "SA", :alpha3 => "SAU", :numeric => "682"}, # Saudi Arabia
    %{:alpha2 => "SB", :alpha3 => "SLB", :numeric => "090"}, # Solomon Islands
    %{:alpha2 => "SC", :alpha3 => "SYC", :numeric => "690"}, # Seychelles
    %{:alpha2 => "SD", :alpha3 => "SDN", :numeric => "729"}, # Sudan
    %{:alpha2 => "SE", :alpha3 => "SWE", :numeric => "752"}, # Sweden
    %{:alpha2 => "SG", :alpha3 => "SGP", :numeric => "702"}, # Singapore
    %{:alpha2 => "SH", :alpha3 => "SHN", :numeric => "654"}, # Saint Helena, Ascension and Tristan da Cunha
    %{:alpha2 => "SI", :alpha3 => "SVN", :numeric => "705"}, # Slovenia
    %{:alpha2 => "SJ", :alpha3 => "SJM", :numeric => "744"}, # Svalbard and Jan Mayen
    %{:alpha2 => "SK", :alpha3 => "SKM", :numeric => nil},   # Sikkim
    %{:alpha2 => "SK", :alpha3 => "SVK", :numeric => "703"}, # Slovakia
    %{:alpha2 => "SL", :alpha3 => "SLE", :numeric => "694"}, # Sierra Leone
    %{:alpha2 => "SM", :alpha3 => "SMR", :numeric => "674"}, # San Marino
    %{:alpha2 => "SN", :alpha3 => "SEN", :numeric => "686"}, # Senegal
    %{:alpha2 => "SO", :alpha3 => "SOM", :numeric => "706"}, # Somalia
    %{:alpha2 => "SR", :alpha3 => "SUR", :numeric => "740"}, # Suriname
    %{:alpha2 => "SS", :alpha3 => "SSD", :numeric => "728"}, # South Sudan
    %{:alpha2 => "ST", :alpha3 => "STP", :numeric => "678"}, # Sao Tome and Principe
    %{:alpha2 => "SU", :alpha3 => "SUN", :numeric => "810"}, # USSR, Union of Soviet Socialist Republics
    %{:alpha2 => "SV", :alpha3 => "SLV", :numeric => "222"}, # El Salvador
    %{:alpha2 => "SX", :alpha3 => "SXM", :numeric => "534"}, # Sint Maarten (Dutch part)
    %{:alpha2 => "SY", :alpha3 => "SYR", :numeric => "760"}, # Syrian Arab Republic
    %{:alpha2 => "SZ", :alpha3 => "SWZ", :numeric => "748"}, # Eswatini
    %{:alpha2 => "TC", :alpha3 => "TCA", :numeric => "796"}, # Turks and Caicos Islands
    %{:alpha2 => "TD", :alpha3 => "TCD", :numeric => "148"}, # Chad
    %{:alpha2 => "TF", :alpha3 => "ATF", :numeric => "260"}, # French Southern Territories
    %{:alpha2 => "TG", :alpha3 => "TGO", :numeric => "768"}, # Togo
    %{:alpha2 => "TH", :alpha3 => "THA", :numeric => "764"}, # Thailand
    %{:alpha2 => "TJ", :alpha3 => "TJK", :numeric => "762"}, # Tajikistan
    %{:alpha2 => "TK", :alpha3 => "TKL", :numeric => "772"}, # Tokelau
    %{:alpha2 => "TL", :alpha3 => "TLS", :numeric => "626"}, # Timor-Leste
    %{:alpha2 => "TM", :alpha3 => "TKM", :numeric => "795"}, # Turkmenistan
    %{:alpha2 => "TN", :alpha3 => "TUN", :numeric => "788"}, # Tunisia
    %{:alpha2 => "TO", :alpha3 => "TON", :numeric => "776"}, # Tonga
    %{:alpha2 => "TP", :alpha3 => "TMP", :numeric => "626"}, # East Timor
    %{:alpha2 => "TR", :alpha3 => "TUR", :numeric => "792"}, # Turkey
    %{:alpha2 => "TT", :alpha3 => "TTO", :numeric => "780"}, # Trinidad and Tobago
    %{:alpha2 => "TV", :alpha3 => "TUV", :numeric => "798"}, # Tuvalu
    %{:alpha2 => "TW", :alpha3 => "TWN", :numeric => "158"}, # Taiwan, Province of China
    %{:alpha2 => "TZ", :alpha3 => "TZA", :numeric => "834"}, # Tanzania, United Republic of
    %{:alpha2 => "UA", :alpha3 => "UKR", :numeric => "804"}, # Ukraine
    %{:alpha2 => "UG", :alpha3 => "UGA", :numeric => "800"}, # Uganda
    %{:alpha2 => "UM", :alpha3 => "UMI", :numeric => "581"}, # United States Minor Outlying Islands
    %{:alpha2 => "US", :alpha3 => "USA", :numeric => "840"}, # United States
    %{:alpha2 => "UY", :alpha3 => "URY", :numeric => "858"}, # Uruguay
    %{:alpha2 => "UZ", :alpha3 => "UZB", :numeric => "860"}, # Uzbekistan
    %{:alpha2 => "VA", :alpha3 => "VAT", :numeric => "336"}, # Holy See (Vatican City State)
    %{:alpha2 => "VC", :alpha3 => "VCT", :numeric => "670"}, # Saint Vincent and the Grenadines
    %{:alpha2 => "VD", :alpha3 => "VDR", :numeric => nil},   # Viet-Nam, Democratic Republic of
    %{:alpha2 => "VE", :alpha3 => "VEN", :numeric => "862"}, # Venezuela, Bolivarian Republic of
    %{:alpha2 => "VG", :alpha3 => "VGB", :numeric => "092"}, # Virgin Islands, British
    %{:alpha2 => "VI", :alpha3 => "VIR", :numeric => "850"}, # Virgin Islands, U.S.
    %{:alpha2 => "VN", :alpha3 => "VNM", :numeric => "704"}, # Viet Nam
    %{:alpha2 => "VU", :alpha3 => "VUT", :numeric => "548"}, # Vanuatu
    %{:alpha2 => "WF", :alpha3 => "WLF", :numeric => "876"}, # Wallis and Futuna
    %{:alpha2 => "WK", :alpha3 => "WAK", :numeric => "872"}, # Wake Island
    %{:alpha2 => "WS", :alpha3 => "WSM", :numeric => "882"}, # Samoa
    %{:alpha2 => "YD", :alpha3 => "YMD", :numeric => "720"}, # Yemen, Democratic, People"s Democratic Republic of
    %{:alpha2 => "YE", :alpha3 => "YEM", :numeric => "887"}, # Yemen
    %{:alpha2 => "YT", :alpha3 => "MYT", :numeric => "175"}, # Mayotte
    %{:alpha2 => "YU", :alpha3 => "YUG", :numeric => "891"}, # Yugoslavia, Socialist Federal Republic of
    %{:alpha2 => "ZA", :alpha3 => "ZAF", :numeric => "710"}, # South Africa
    %{:alpha2 => "ZM", :alpha3 => "ZMB", :numeric => "894"}, # Zambia
    %{:alpha2 => "ZR", :alpha3 => "ZAR", :numeric => "180"}, # Zaire, Republic of
    %{:alpha2 => "ZW", :alpha3 => "ZWE", :numeric => "716"}, # Zimbabwe
  ]

  @spec validate(String.t, atom) :: boolean
  def validate(input, type \\ :alpha2) when is_binary(input) and is_atom(type) do
    unless Enum.member?([:alpha2, :alpha3, :numeric], type) do
      raise "Invalid type param. It should be either: :alpha2, :alpha3 or :numeric."
    end

    result =
      Enum.find(@country_codes, fn country_code ->
        country_code[type] == input
      end)

    result != nil
  end
end

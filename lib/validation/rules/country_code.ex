defmodule Validation.Rules.CountryCode do
  @moduledoc false

  @country_codes [
    # Andorra
    %{:alpha2 => "AD", :alpha3 => "AND", :numeric => "020"},
    # United Arab Emirates
    %{:alpha2 => "AE", :alpha3 => "ARE", :numeric => "784"},
    # Afghanistan
    %{:alpha2 => "AF", :alpha3 => "AFG", :numeric => "004"},
    # Antigua and Barbuda
    %{:alpha2 => "AG", :alpha3 => "ATG", :numeric => "028"},
    # French Afars and Issas
    %{:alpha2 => "AI", :alpha3 => "AFI", :numeric => "262"},
    # Anguilla
    %{:alpha2 => "AI", :alpha3 => "AIA", :numeric => "660"},
    # Albania
    %{:alpha2 => "AL", :alpha3 => "ALB", :numeric => "008"},
    # Armenia
    %{:alpha2 => "AM", :alpha3 => "ARM", :numeric => "051"},
    # Netherlands Antilles
    %{:alpha2 => "AN", :alpha3 => "ANT", :numeric => "530"},
    # Angola
    %{:alpha2 => "AO", :alpha3 => "AGO", :numeric => "024"},
    # Antarctica
    %{:alpha2 => "AQ", :alpha3 => "ATA", :numeric => "010"},
    # Argentina
    %{:alpha2 => "AR", :alpha3 => "ARG", :numeric => "032"},
    # American Samoa
    %{:alpha2 => "AS", :alpha3 => "ASM", :numeric => "016"},
    # Austria
    %{:alpha2 => "AT", :alpha3 => "AUT", :numeric => "040"},
    # Australia
    %{:alpha2 => "AU", :alpha3 => "AUS", :numeric => "036"},
    # Aruba
    %{:alpha2 => "AW", :alpha3 => "ABW", :numeric => "533"},
    # Åland Islands
    %{:alpha2 => "AX", :alpha3 => "ALA", :numeric => "248"},
    # Azerbaijan
    %{:alpha2 => "AZ", :alpha3 => "AZE", :numeric => "031"},
    # Bosnia and Herzegovina
    %{:alpha2 => "BA", :alpha3 => "BIH", :numeric => "070"},
    # Barbados
    %{:alpha2 => "BB", :alpha3 => "BRB", :numeric => "052"},
    # Bangladesh
    %{:alpha2 => "BD", :alpha3 => "BGD", :numeric => "050"},
    # Belgium
    %{:alpha2 => "BE", :alpha3 => "BEL", :numeric => "056"},
    # Burkina Faso
    %{:alpha2 => "BF", :alpha3 => "BFA", :numeric => "854"},
    # Bulgaria
    %{:alpha2 => "BG", :alpha3 => "BGR", :numeric => "100"},
    # Bahrain
    %{:alpha2 => "BH", :alpha3 => "BHR", :numeric => "048"},
    # Burundi
    %{:alpha2 => "BI", :alpha3 => "BDI", :numeric => "108"},
    # Benin
    %{:alpha2 => "BJ", :alpha3 => "BEN", :numeric => "204"},
    # Saint Barthélemy
    %{:alpha2 => "BL", :alpha3 => "BLM", :numeric => "652"},
    # Bermuda
    %{:alpha2 => "BM", :alpha3 => "BMU", :numeric => "060"},
    # Brunei Darussalam
    %{:alpha2 => "BN", :alpha3 => "BRN", :numeric => "096"},
    # Bolivia, Plurinational State of
    %{:alpha2 => "BO", :alpha3 => "BOL", :numeric => "068"},
    # British Antarctic Territory
    %{:alpha2 => "BQ", :alpha3 => "ATB", :numeric => nil},
    # Bonaire, Sint Eustatius and Saba
    %{:alpha2 => "BQ", :alpha3 => "BES", :numeric => "535"},
    # Brazil
    %{:alpha2 => "BR", :alpha3 => "BRA", :numeric => "076"},
    # Bahamas
    %{:alpha2 => "BS", :alpha3 => "BHS", :numeric => "044"},
    # Bhutan
    %{:alpha2 => "BT", :alpha3 => "BTN", :numeric => "064"},
    # Burma, Socialist Republic of the Union of
    %{:alpha2 => "BU", :alpha3 => "BUR", :numeric => "104"},
    # Bouvet Island
    %{:alpha2 => "BV", :alpha3 => "BVT", :numeric => "074"},
    # Botswana
    %{:alpha2 => "BW", :alpha3 => "BWA", :numeric => "072"},
    # Belarus
    %{:alpha2 => "BY", :alpha3 => "BLR", :numeric => "112"},
    # Byelorussian SSR Soviet Socialist Republic
    %{:alpha2 => "BY", :alpha3 => "BYS", :numeric => "112"},
    # Belize
    %{:alpha2 => "BZ", :alpha3 => "BLZ", :numeric => "084"},
    # Canada
    %{:alpha2 => "CA", :alpha3 => "CAN", :numeric => "124"},
    # Cocos (Keeling) Islands
    %{:alpha2 => "CC", :alpha3 => "CCK", :numeric => "166"},
    # Congo, The Democratic Republic of the
    %{:alpha2 => "CD", :alpha3 => "COD", :numeric => "180"},
    # Central African Republic
    %{:alpha2 => "CF", :alpha3 => "CAF", :numeric => "140"},
    # Congo
    %{:alpha2 => "CG", :alpha3 => "COG", :numeric => "178"},
    # Switzerland
    %{:alpha2 => "CH", :alpha3 => "CHE", :numeric => "756"},
    # Côte d"Ivoire
    %{:alpha2 => "CI", :alpha3 => "CIV", :numeric => "384"},
    # Cook Islands
    %{:alpha2 => "CK", :alpha3 => "COK", :numeric => "184"},
    # Chile
    %{:alpha2 => "CL", :alpha3 => "CHL", :numeric => "152"},
    # Cameroon
    %{:alpha2 => "CM", :alpha3 => "CMR", :numeric => "120"},
    # China
    %{:alpha2 => "CN", :alpha3 => "CHN", :numeric => "156"},
    # Colombia
    %{:alpha2 => "CO", :alpha3 => "COL", :numeric => "170"},
    # Costa Rica
    %{:alpha2 => "CR", :alpha3 => "CRI", :numeric => "188"},
    # Czechoslovakia, Czechoslovak Socialist Republic
    %{:alpha2 => "CS", :alpha3 => "CSK", :numeric => "200"},
    # Serbia and Montenegro
    %{:alpha2 => "CS", :alpha3 => "SCG", :numeric => "891"},
    # Canton and Enderbury Islands
    %{:alpha2 => "CT", :alpha3 => "CTE", :numeric => "128"},
    # Cuba
    %{:alpha2 => "CU", :alpha3 => "CUB", :numeric => "192"},
    # Cabo Verde
    %{:alpha2 => "CV", :alpha3 => "CPV", :numeric => "132"},
    # Curaçao
    %{:alpha2 => "CW", :alpha3 => "CUW", :numeric => "531"},
    # Christmas Island
    %{:alpha2 => "CX", :alpha3 => "CXR", :numeric => "162"},
    # Cyprus
    %{:alpha2 => "CY", :alpha3 => "CYP", :numeric => "196"},
    # Czechia
    %{:alpha2 => "CZ", :alpha3 => "CZE", :numeric => "203"},
    # German Democratic Republic
    %{:alpha2 => "DD", :alpha3 => "DDR", :numeric => "278"},
    # Germany
    %{:alpha2 => "DE", :alpha3 => "DEU", :numeric => "276"},
    # Djibouti
    %{:alpha2 => "DJ", :alpha3 => "DJI", :numeric => "262"},
    # Denmark
    %{:alpha2 => "DK", :alpha3 => "DNK", :numeric => "208"},
    # Dominica
    %{:alpha2 => "DM", :alpha3 => "DMA", :numeric => "212"},
    # Dominican Republic
    %{:alpha2 => "DO", :alpha3 => "DOM", :numeric => "214"},
    # Dahomey
    %{:alpha2 => "DY", :alpha3 => "DHY", :numeric => "204"},
    # Algeria
    %{:alpha2 => "DZ", :alpha3 => "DZA", :numeric => "012"},
    # Ecuador
    %{:alpha2 => "EC", :alpha3 => "ECU", :numeric => "218"},
    # Estonia
    %{:alpha2 => "EE", :alpha3 => "EST", :numeric => "233"},
    # Egypt
    %{:alpha2 => "EG", :alpha3 => "EGY", :numeric => "818"},
    # Western Sahara
    %{:alpha2 => "EH", :alpha3 => "ESH", :numeric => "732"},
    # Eritrea
    %{:alpha2 => "ER", :alpha3 => "ERI", :numeric => "232"},
    # Spain
    %{:alpha2 => "ES", :alpha3 => "ESP", :numeric => "724"},
    # Ethiopia
    %{:alpha2 => "ET", :alpha3 => "ETH", :numeric => "231"},
    # Finland
    %{:alpha2 => "FI", :alpha3 => "FIN", :numeric => "246"},
    # Fiji
    %{:alpha2 => "FJ", :alpha3 => "FJI", :numeric => "242"},
    # Falkland Islands (Malvinas)
    %{:alpha2 => "FK", :alpha3 => "FLK", :numeric => "238"},
    # Micronesia, Federated States of
    %{:alpha2 => "FM", :alpha3 => "FSM", :numeric => "583"},
    # Faroe Islands
    %{:alpha2 => "FO", :alpha3 => "FRO", :numeric => "234"},
    # French Southern and Antarctic Territories
    %{:alpha2 => "FQ", :alpha3 => "ATF", :numeric => nil},
    # France
    %{:alpha2 => "FR", :alpha3 => "FRA", :numeric => "250"},
    # France, Metropolitan
    %{:alpha2 => "FX", :alpha3 => "FXX", :numeric => "249"},
    # Gabon
    %{:alpha2 => "GA", :alpha3 => "GAB", :numeric => "266"},
    # United Kingdom
    %{:alpha2 => "GB", :alpha3 => "GBR", :numeric => "826"},
    # Grenada
    %{:alpha2 => "GD", :alpha3 => "GRD", :numeric => "308"},
    # Gilbert and Ellice Islands
    %{:alpha2 => "GE", :alpha3 => "GEL", :numeric => "296"},
    # Georgia
    %{:alpha2 => "GE", :alpha3 => "GEO", :numeric => "268"},
    # French Guiana
    %{:alpha2 => "GF", :alpha3 => "GUF", :numeric => "254"},
    # Guernsey
    %{:alpha2 => "GG", :alpha3 => "GGY", :numeric => "831"},
    # Ghana
    %{:alpha2 => "GH", :alpha3 => "GHA", :numeric => "288"},
    # Gibraltar
    %{:alpha2 => "GI", :alpha3 => "GIB", :numeric => "292"},
    # Greenland
    %{:alpha2 => "GL", :alpha3 => "GRL", :numeric => "304"},
    # Gambia
    %{:alpha2 => "GM", :alpha3 => "GMB", :numeric => "270"},
    # Guinea
    %{:alpha2 => "GN", :alpha3 => "GIN", :numeric => "324"},
    # Guadeloupe
    %{:alpha2 => "GP", :alpha3 => "GLP", :numeric => "312"},
    # Equatorial Guinea
    %{:alpha2 => "GQ", :alpha3 => "GNQ", :numeric => "226"},
    # Greece
    %{:alpha2 => "GR", :alpha3 => "GRC", :numeric => "300"},
    # South Georgia and the South Sandwich Islands
    %{:alpha2 => "GS", :alpha3 => "SGS", :numeric => "239"},
    # Guatemala
    %{:alpha2 => "GT", :alpha3 => "GTM", :numeric => "320"},
    # Guam
    %{:alpha2 => "GU", :alpha3 => "GUM", :numeric => "316"},
    # Guinea-Bissau
    %{:alpha2 => "GW", :alpha3 => "GNB", :numeric => "624"},
    # Guyana
    %{:alpha2 => "GY", :alpha3 => "GUY", :numeric => "328"},
    # Hong Kong
    %{:alpha2 => "HK", :alpha3 => "HKG", :numeric => "344"},
    # Heard Island and McDonald Islands
    %{:alpha2 => "HM", :alpha3 => "HMD", :numeric => "334"},
    # Honduras
    %{:alpha2 => "HN", :alpha3 => "HND", :numeric => "340"},
    # Croatia
    %{:alpha2 => "HR", :alpha3 => "HRV", :numeric => "191"},
    # Haiti
    %{:alpha2 => "HT", :alpha3 => "HTI", :numeric => "332"},
    # Hungary
    %{:alpha2 => "HU", :alpha3 => "HUN", :numeric => "348"},
    # Upper Volta, Republic of
    %{:alpha2 => "HV", :alpha3 => "HVO", :numeric => "854"},
    # Indonesia
    %{:alpha2 => "ID", :alpha3 => "IDN", :numeric => "360"},
    # Ireland
    %{:alpha2 => "IE", :alpha3 => "IRL", :numeric => "372"},
    # Israel
    %{:alpha2 => "IL", :alpha3 => "ISR", :numeric => "376"},
    # Isle of Man
    %{:alpha2 => "IM", :alpha3 => "IMN", :numeric => "833"},
    # India
    %{:alpha2 => "IN", :alpha3 => "IND", :numeric => "356"},
    # British Indian Ocean Territory
    %{:alpha2 => "IO", :alpha3 => "IOT", :numeric => "086"},
    # Iraq
    %{:alpha2 => "IQ", :alpha3 => "IRQ", :numeric => "368"},
    # Iran, Islamic Republic of
    %{:alpha2 => "IR", :alpha3 => "IRN", :numeric => "364"},
    # Iceland
    %{:alpha2 => "IS", :alpha3 => "ISL", :numeric => "352"},
    # Italy
    %{:alpha2 => "IT", :alpha3 => "ITA", :numeric => "380"},
    # Jersey
    %{:alpha2 => "JE", :alpha3 => "JEY", :numeric => "832"},
    # Jamaica
    %{:alpha2 => "JM", :alpha3 => "JAM", :numeric => "388"},
    # Jordan
    %{:alpha2 => "JO", :alpha3 => "JOR", :numeric => "400"},
    # Japan
    %{:alpha2 => "JP", :alpha3 => "JPN", :numeric => "392"},
    # Johnston Island
    %{:alpha2 => "JT", :alpha3 => "JTN", :numeric => "396"},
    # Kenya
    %{:alpha2 => "KE", :alpha3 => "KEN", :numeric => "404"},
    # Kyrgyzstan
    %{:alpha2 => "KG", :alpha3 => "KGZ", :numeric => "417"},
    # Cambodia
    %{:alpha2 => "KH", :alpha3 => "KHM", :numeric => "116"},
    # Kiribati
    %{:alpha2 => "KI", :alpha3 => "KIR", :numeric => "296"},
    # Comoros
    %{:alpha2 => "KM", :alpha3 => "COM", :numeric => "174"},
    # Saint Kitts and Nevis
    %{:alpha2 => "KN", :alpha3 => "KNA", :numeric => "659"},
    # Korea, Democratic People"s Republic of
    %{:alpha2 => "KP", :alpha3 => "PRK", :numeric => "408"},
    # Korea, Republic of
    %{:alpha2 => "KR", :alpha3 => "KOR", :numeric => "410"},
    # Kuwait
    %{:alpha2 => "KW", :alpha3 => "KWT", :numeric => "414"},
    # Cayman Islands
    %{:alpha2 => "KY", :alpha3 => "CYM", :numeric => "136"},
    # Kazakhstan
    %{:alpha2 => "KZ", :alpha3 => "KAZ", :numeric => "398"},
    # Lao People"s Democratic Republic
    %{:alpha2 => "LA", :alpha3 => "LAO", :numeric => "418"},
    # Lebanon
    %{:alpha2 => "LB", :alpha3 => "LBN", :numeric => "422"},
    # Saint Lucia
    %{:alpha2 => "LC", :alpha3 => "LCA", :numeric => "662"},
    # Liechtenstein
    %{:alpha2 => "LI", :alpha3 => "LIE", :numeric => "438"},
    # Sri Lanka
    %{:alpha2 => "LK", :alpha3 => "LKA", :numeric => "144"},
    # Liberia
    %{:alpha2 => "LR", :alpha3 => "LBR", :numeric => "430"},
    # Lesotho
    %{:alpha2 => "LS", :alpha3 => "LSO", :numeric => "426"},
    # Lithuania
    %{:alpha2 => "LT", :alpha3 => "LTU", :numeric => "440"},
    # Luxembourg
    %{:alpha2 => "LU", :alpha3 => "LUX", :numeric => "442"},
    # Latvia
    %{:alpha2 => "LV", :alpha3 => "LVA", :numeric => "428"},
    # Libya
    %{:alpha2 => "LY", :alpha3 => "LBY", :numeric => "434"},
    # Morocco
    %{:alpha2 => "MA", :alpha3 => "MAR", :numeric => "504"},
    # Monaco
    %{:alpha2 => "MC", :alpha3 => "MCO", :numeric => "492"},
    # Moldova, Republic of
    %{:alpha2 => "MD", :alpha3 => "MDA", :numeric => "498"},
    # Montenegro
    %{:alpha2 => "ME", :alpha3 => "MNE", :numeric => "499"},
    # Saint Martin (French part)
    %{:alpha2 => "MF", :alpha3 => "MAF", :numeric => "663"},
    # Madagascar
    %{:alpha2 => "MG", :alpha3 => "MDG", :numeric => "450"},
    # Marshall Islands
    %{:alpha2 => "MH", :alpha3 => "MHL", :numeric => "584"},
    # Midway Islands
    %{:alpha2 => "MI", :alpha3 => "MID", :numeric => "488"},
    # North Macedonia
    %{:alpha2 => "MK", :alpha3 => "MKD", :numeric => "807"},
    # Mali
    %{:alpha2 => "ML", :alpha3 => "MLI", :numeric => "466"},
    # Myanmar
    %{:alpha2 => "MM", :alpha3 => "MMR", :numeric => "104"},
    # Mongolia
    %{:alpha2 => "MN", :alpha3 => "MNG", :numeric => "496"},
    # Macao
    %{:alpha2 => "MO", :alpha3 => "MAC", :numeric => "446"},
    # Northern Mariana Islands
    %{:alpha2 => "MP", :alpha3 => "MNP", :numeric => "580"},
    # Martinique
    %{:alpha2 => "MQ", :alpha3 => "MTQ", :numeric => "474"},
    # Mauritania
    %{:alpha2 => "MR", :alpha3 => "MRT", :numeric => "478"},
    # Montserrat
    %{:alpha2 => "MS", :alpha3 => "MSR", :numeric => "500"},
    # Malta
    %{:alpha2 => "MT", :alpha3 => "MLT", :numeric => "470"},
    # Mauritius
    %{:alpha2 => "MU", :alpha3 => "MUS", :numeric => "480"},
    # Maldives
    %{:alpha2 => "MV", :alpha3 => "MDV", :numeric => "462"},
    # Malawi
    %{:alpha2 => "MW", :alpha3 => "MWI", :numeric => "454"},
    # Mexico
    %{:alpha2 => "MX", :alpha3 => "MEX", :numeric => "484"},
    # Malaysia
    %{:alpha2 => "MY", :alpha3 => "MYS", :numeric => "458"},
    # Mozambique
    %{:alpha2 => "MZ", :alpha3 => "MOZ", :numeric => "508"},
    # Namibia
    %{:alpha2 => "NA", :alpha3 => "NAM", :numeric => "516"},
    # New Caledonia
    %{:alpha2 => "NC", :alpha3 => "NCL", :numeric => "540"},
    # Niger
    %{:alpha2 => "NE", :alpha3 => "NER", :numeric => "562"},
    # Norfolk Island
    %{:alpha2 => "NF", :alpha3 => "NFK", :numeric => "574"},
    # Nigeria
    %{:alpha2 => "NG", :alpha3 => "NGA", :numeric => "566"},
    # New Hebrides
    %{:alpha2 => "NH", :alpha3 => "NHB", :numeric => "548"},
    # Nicaragua
    %{:alpha2 => "NI", :alpha3 => "NIC", :numeric => "558"},
    # Netherlands
    %{:alpha2 => "NL", :alpha3 => "NLD", :numeric => "528"},
    # Norway
    %{:alpha2 => "NO", :alpha3 => "NOR", :numeric => "578"},
    # Nepal
    %{:alpha2 => "NP", :alpha3 => "NPL", :numeric => "524"},
    # Dronning Maud Land
    %{:alpha2 => "NQ", :alpha3 => "ATN", :numeric => "216"},
    # Nauru
    %{:alpha2 => "NR", :alpha3 => "NRU", :numeric => "520"},
    # Neutral Zone
    %{:alpha2 => "NT", :alpha3 => "NTZ", :numeric => "536"},
    # Niue
    %{:alpha2 => "NU", :alpha3 => "NIU", :numeric => "570"},
    # New Zealand
    %{:alpha2 => "NZ", :alpha3 => "NZL", :numeric => "554"},
    # Oman
    %{:alpha2 => "OM", :alpha3 => "OMN", :numeric => "512"},
    # Panama
    %{:alpha2 => "PA", :alpha3 => "PAN", :numeric => "591"},
    # Pacific Islands (trust territory)
    %{:alpha2 => "PC", :alpha3 => "PCI", :numeric => "582"},
    # Peru
    %{:alpha2 => "PE", :alpha3 => "PER", :numeric => "604"},
    # French Polynesia
    %{:alpha2 => "PF", :alpha3 => "PYF", :numeric => "258"},
    # Papua New Guinea
    %{:alpha2 => "PG", :alpha3 => "PNG", :numeric => "598"},
    # Philippines
    %{:alpha2 => "PH", :alpha3 => "PHL", :numeric => "608"},
    # Pakistan
    %{:alpha2 => "PK", :alpha3 => "PAK", :numeric => "586"},
    # Poland
    %{:alpha2 => "PL", :alpha3 => "POL", :numeric => "616"},
    # Saint Pierre and Miquelon
    %{:alpha2 => "PM", :alpha3 => "SPM", :numeric => "666"},
    # Pitcairn
    %{:alpha2 => "PN", :alpha3 => "PCN", :numeric => "612"},
    # Puerto Rico
    %{:alpha2 => "PR", :alpha3 => "PRI", :numeric => "630"},
    # Palestine, State of
    %{:alpha2 => "PS", :alpha3 => "PSE", :numeric => "275"},
    # Portugal
    %{:alpha2 => "PT", :alpha3 => "PRT", :numeric => "620"},
    # US Miscellaneous Pacific Islands
    %{:alpha2 => "PU", :alpha3 => "PUS", :numeric => "849"},
    # Palau
    %{:alpha2 => "PW", :alpha3 => "PLW", :numeric => "585"},
    # Paraguay
    %{:alpha2 => "PY", :alpha3 => "PRY", :numeric => "600"},
    # Panama Canal Zone
    %{:alpha2 => "PZ", :alpha3 => "PCZ", :numeric => nil},
    # Qatar
    %{:alpha2 => "QA", :alpha3 => "QAT", :numeric => "634"},
    # Réunion
    %{:alpha2 => "RE", :alpha3 => "REU", :numeric => "638"},
    # Southern Rhodesia
    %{:alpha2 => "RH", :alpha3 => "RHO", :numeric => "716"},
    # Romania
    %{:alpha2 => "RO", :alpha3 => "ROU", :numeric => "642"},
    # Serbia
    %{:alpha2 => "RS", :alpha3 => "SRB", :numeric => "688"},
    # Russian Federation
    %{:alpha2 => "RU", :alpha3 => "RUS", :numeric => "643"},
    # Rwanda
    %{:alpha2 => "RW", :alpha3 => "RWA", :numeric => "646"},
    # Saudi Arabia
    %{:alpha2 => "SA", :alpha3 => "SAU", :numeric => "682"},
    # Solomon Islands
    %{:alpha2 => "SB", :alpha3 => "SLB", :numeric => "090"},
    # Seychelles
    %{:alpha2 => "SC", :alpha3 => "SYC", :numeric => "690"},
    # Sudan
    %{:alpha2 => "SD", :alpha3 => "SDN", :numeric => "729"},
    # Sweden
    %{:alpha2 => "SE", :alpha3 => "SWE", :numeric => "752"},
    # Singapore
    %{:alpha2 => "SG", :alpha3 => "SGP", :numeric => "702"},
    # Saint Helena, Ascension and Tristan da Cunha
    %{:alpha2 => "SH", :alpha3 => "SHN", :numeric => "654"},
    # Slovenia
    %{:alpha2 => "SI", :alpha3 => "SVN", :numeric => "705"},
    # Svalbard and Jan Mayen
    %{:alpha2 => "SJ", :alpha3 => "SJM", :numeric => "744"},
    # Sikkim
    %{:alpha2 => "SK", :alpha3 => "SKM", :numeric => nil},
    # Slovakia
    %{:alpha2 => "SK", :alpha3 => "SVK", :numeric => "703"},
    # Sierra Leone
    %{:alpha2 => "SL", :alpha3 => "SLE", :numeric => "694"},
    # San Marino
    %{:alpha2 => "SM", :alpha3 => "SMR", :numeric => "674"},
    # Senegal
    %{:alpha2 => "SN", :alpha3 => "SEN", :numeric => "686"},
    # Somalia
    %{:alpha2 => "SO", :alpha3 => "SOM", :numeric => "706"},
    # Suriname
    %{:alpha2 => "SR", :alpha3 => "SUR", :numeric => "740"},
    # South Sudan
    %{:alpha2 => "SS", :alpha3 => "SSD", :numeric => "728"},
    # Sao Tome and Principe
    %{:alpha2 => "ST", :alpha3 => "STP", :numeric => "678"},
    # USSR, Union of Soviet Socialist Republics
    %{:alpha2 => "SU", :alpha3 => "SUN", :numeric => "810"},
    # El Salvador
    %{:alpha2 => "SV", :alpha3 => "SLV", :numeric => "222"},
    # Sint Maarten (Dutch part)
    %{:alpha2 => "SX", :alpha3 => "SXM", :numeric => "534"},
    # Syrian Arab Republic
    %{:alpha2 => "SY", :alpha3 => "SYR", :numeric => "760"},
    # Eswatini
    %{:alpha2 => "SZ", :alpha3 => "SWZ", :numeric => "748"},
    # Turks and Caicos Islands
    %{:alpha2 => "TC", :alpha3 => "TCA", :numeric => "796"},
    # Chad
    %{:alpha2 => "TD", :alpha3 => "TCD", :numeric => "148"},
    # French Southern Territories
    %{:alpha2 => "TF", :alpha3 => "ATF", :numeric => "260"},
    # Togo
    %{:alpha2 => "TG", :alpha3 => "TGO", :numeric => "768"},
    # Thailand
    %{:alpha2 => "TH", :alpha3 => "THA", :numeric => "764"},
    # Tajikistan
    %{:alpha2 => "TJ", :alpha3 => "TJK", :numeric => "762"},
    # Tokelau
    %{:alpha2 => "TK", :alpha3 => "TKL", :numeric => "772"},
    # Timor-Leste
    %{:alpha2 => "TL", :alpha3 => "TLS", :numeric => "626"},
    # Turkmenistan
    %{:alpha2 => "TM", :alpha3 => "TKM", :numeric => "795"},
    # Tunisia
    %{:alpha2 => "TN", :alpha3 => "TUN", :numeric => "788"},
    # Tonga
    %{:alpha2 => "TO", :alpha3 => "TON", :numeric => "776"},
    # East Timor
    %{:alpha2 => "TP", :alpha3 => "TMP", :numeric => "626"},
    # Turkey
    %{:alpha2 => "TR", :alpha3 => "TUR", :numeric => "792"},
    # Trinidad and Tobago
    %{:alpha2 => "TT", :alpha3 => "TTO", :numeric => "780"},
    # Tuvalu
    %{:alpha2 => "TV", :alpha3 => "TUV", :numeric => "798"},
    # Taiwan, Province of China
    %{:alpha2 => "TW", :alpha3 => "TWN", :numeric => "158"},
    # Tanzania, United Republic of
    %{:alpha2 => "TZ", :alpha3 => "TZA", :numeric => "834"},
    # Ukraine
    %{:alpha2 => "UA", :alpha3 => "UKR", :numeric => "804"},
    # Uganda
    %{:alpha2 => "UG", :alpha3 => "UGA", :numeric => "800"},
    # United States Minor Outlying Islands
    %{:alpha2 => "UM", :alpha3 => "UMI", :numeric => "581"},
    # United States
    %{:alpha2 => "US", :alpha3 => "USA", :numeric => "840"},
    # Uruguay
    %{:alpha2 => "UY", :alpha3 => "URY", :numeric => "858"},
    # Uzbekistan
    %{:alpha2 => "UZ", :alpha3 => "UZB", :numeric => "860"},
    # Holy See (Vatican City State)
    %{:alpha2 => "VA", :alpha3 => "VAT", :numeric => "336"},
    # Saint Vincent and the Grenadines
    %{:alpha2 => "VC", :alpha3 => "VCT", :numeric => "670"},
    # Viet-Nam, Democratic Republic of
    %{:alpha2 => "VD", :alpha3 => "VDR", :numeric => nil},
    # Venezuela, Bolivarian Republic of
    %{:alpha2 => "VE", :alpha3 => "VEN", :numeric => "862"},
    # Virgin Islands, British
    %{:alpha2 => "VG", :alpha3 => "VGB", :numeric => "092"},
    # Virgin Islands, U.S.
    %{:alpha2 => "VI", :alpha3 => "VIR", :numeric => "850"},
    # Viet Nam
    %{:alpha2 => "VN", :alpha3 => "VNM", :numeric => "704"},
    # Vanuatu
    %{:alpha2 => "VU", :alpha3 => "VUT", :numeric => "548"},
    # Wallis and Futuna
    %{:alpha2 => "WF", :alpha3 => "WLF", :numeric => "876"},
    # Wake Island
    %{:alpha2 => "WK", :alpha3 => "WAK", :numeric => "872"},
    # Samoa
    %{:alpha2 => "WS", :alpha3 => "WSM", :numeric => "882"},
    # Yemen, Democratic, People"s Democratic Republic of
    %{:alpha2 => "YD", :alpha3 => "YMD", :numeric => "720"},
    # Yemen
    %{:alpha2 => "YE", :alpha3 => "YEM", :numeric => "887"},
    # Mayotte
    %{:alpha2 => "YT", :alpha3 => "MYT", :numeric => "175"},
    # Yugoslavia, Socialist Federal Republic of
    %{:alpha2 => "YU", :alpha3 => "YUG", :numeric => "891"},
    # South Africa
    %{:alpha2 => "ZA", :alpha3 => "ZAF", :numeric => "710"},
    # Zambia
    %{:alpha2 => "ZM", :alpha3 => "ZMB", :numeric => "894"},
    # Zaire, Republic of
    %{:alpha2 => "ZR", :alpha3 => "ZAR", :numeric => "180"},
    # Zimbabwe
    %{:alpha2 => "ZW", :alpha3 => "ZWE", :numeric => "716"}
  ]

  @spec validate?(String.t(), atom) :: boolean
  def validate?(input, type \\ :alpha2) when is_binary(input) and is_atom(type) do
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

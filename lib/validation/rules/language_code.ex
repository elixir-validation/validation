defmodule Validation.Rules.LanguageCode do
  @moduledoc false

  @language_codes [
    %{:alpha2 => "aa",  :alpha3 => "aar"},     # Afar
    %{:alpha2 => "ab",  :alpha3 => "abk"},     # Abkhazian
    %{:alpha2 => "",    :alpha3 => "ace"},     # Achinese
    %{:alpha2 => "",    :alpha3 => "ach"},     # Acoli
    %{:alpha2 => "",    :alpha3 => "ada"},     # Adangme
    %{:alpha2 => "",    :alpha3 => "ady"},     # Adyghe; Adygei
    %{:alpha2 => "",    :alpha3 => "afa"},     # Afro-Asiatic languages
    %{:alpha2 => "",    :alpha3 => "afh"},     # Afrihili
    %{:alpha2 => "af",  :alpha3 => "afr"},     # Afrikaans
    %{:alpha2 => "",    :alpha3 => "ain"},     # Ainu
    %{:alpha2 => "ak",  :alpha3 => "aka"},     # Akan
    %{:alpha2 => "",    :alpha3 => "akk"},     # Akkadian
    %{:alpha2 => "sq",  :alpha3 => "alb"},     # Albanian
    %{:alpha2 => "",    :alpha3 => "ale"},     # Aleut
    %{:alpha2 => "",    :alpha3 => "alg"},     # Algonquian languages
    %{:alpha2 => "",    :alpha3 => "alt"},     # Southern Altai
    %{:alpha2 => "am",  :alpha3 => "amh"},     # Amharic
    %{:alpha2 => "",    :alpha3 => "ang"},     # English, Old (ca.450-1100)
    %{:alpha2 => "",    :alpha3 => "anp"},     # Angika
    %{:alpha2 => "",    :alpha3 => "apa"},     # Apache languages
    %{:alpha2 => "ar",  :alpha3 => "ara"},     # Arabic
    %{:alpha2 => "",    :alpha3 => "arc"},     # Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)
    %{:alpha2 => "an",  :alpha3 => "arg"},     # Aragonese
    %{:alpha2 => "hy",  :alpha3 => "arm"},     # Armenian
    %{:alpha2 => "",    :alpha3 => "arn"},     # Mapudungun; Mapuche
    %{:alpha2 => "",    :alpha3 => "arp"},     # Arapaho
    %{:alpha2 => "",    :alpha3 => "art"},     # Artificial languages
    %{:alpha2 => "",    :alpha3 => "arw"},     # Arawak
    %{:alpha2 => "as",  :alpha3 => "asm"},     # Assamese
    %{:alpha2 => "",    :alpha3 => "ast"},     # Asturian; Bable; Leonese; Asturleonese
    %{:alpha2 => "",    :alpha3 => "ath"},     # Athapascan languages
    %{:alpha2 => "",    :alpha3 => "aus"},     # Australian languages
    %{:alpha2 => "av",  :alpha3 => "ava"},     # Avaric
    %{:alpha2 => "ae",  :alpha3 => "ave"},     # Avestan
    %{:alpha2 => "",    :alpha3 => "awa"},     # Awadhi
    %{:alpha2 => "ay",  :alpha3 => "aym"},     # Aymara
    %{:alpha2 => "az",  :alpha3 => "aze"},     # Azerbaijani
    %{:alpha2 => "",    :alpha3 => "bad"},     # Banda languages
    %{:alpha2 => "",    :alpha3 => "bai"},     # Bamileke languages
    %{:alpha2 => "ba",  :alpha3 => "bak"},     # Bashkir
    %{:alpha2 => "",    :alpha3 => "bal"},     # Baluchi
    %{:alpha2 => "bm",  :alpha3 => "bam"},     # Bambara
    %{:alpha2 => "",    :alpha3 => "ban"},     # Balinese
    %{:alpha2 => "eu",  :alpha3 => "baq"},     # Basque
    %{:alpha2 => "",    :alpha3 => "bas"},     # Basa
    %{:alpha2 => "",    :alpha3 => "bat"},     # Baltic languages
    %{:alpha2 => "",    :alpha3 => "bej"},     # Beja; Bedawiyet
    %{:alpha2 => "be",  :alpha3 => "bel"},     # Belarusian
    %{:alpha2 => "",    :alpha3 => "bem"},     # Bemba
    %{:alpha2 => "bn",  :alpha3 => "ben"},     # Bengali
    %{:alpha2 => "",    :alpha3 => "ber"},     # Berber languages
    %{:alpha2 => "",    :alpha3 => "bho"},     # Bhojpuri
    %{:alpha2 => "bh",  :alpha3 => "bih"},     # Bihari languages
    %{:alpha2 => "",    :alpha3 => "bik"},     # Bikol
    %{:alpha2 => "",    :alpha3 => "bin"},     # Bini; Edo
    %{:alpha2 => "bi",  :alpha3 => "bis"},     # Bislama
    %{:alpha2 => "",    :alpha3 => "bla"},     # Siksika
    %{:alpha2 => "",    :alpha3 => "bnt"},     # Bantu - Other
    %{:alpha2 => "bs",  :alpha3 => "bos"},     # Bosnian
    %{:alpha2 => "",    :alpha3 => "bra"},     # Braj
    %{:alpha2 => "br",  :alpha3 => "bre"},     # Breton
    %{:alpha2 => "",    :alpha3 => "btk"},     # Batak languages
    %{:alpha2 => "",    :alpha3 => "bua"},     # Buriat
    %{:alpha2 => "",    :alpha3 => "bug"},     # Buginese
    %{:alpha2 => "bg",  :alpha3 => "bul"},     # Bulgarian
    %{:alpha2 => "my",  :alpha3 => "bur"},     # Burmese
    %{:alpha2 => "",    :alpha3 => "byn"},     # Blin; Bilin
    %{:alpha2 => "",    :alpha3 => "cad"},     # Caddo
    %{:alpha2 => "",    :alpha3 => "cai"},     # Central American Indian languages
    %{:alpha2 => "",    :alpha3 => "car"},     # Galibi Carib
    %{:alpha2 => "ca",  :alpha3 => "cat"},     # Catalan; Valencian
    %{:alpha2 => "",    :alpha3 => "cau"},     # Caucasian languages
    %{:alpha2 => "",    :alpha3 => "ceb"},     # Cebuano
    %{:alpha2 => "",    :alpha3 => "cel"},     # Celtic languages
    %{:alpha2 => "ch",  :alpha3 => "cha"},     # Chamorro
    %{:alpha2 => "",    :alpha3 => "chb"},     # Chibcha
    %{:alpha2 => "ce",  :alpha3 => "che"},     # Chechen
    %{:alpha2 => "",    :alpha3 => "chg"},     # Chagatai
    %{:alpha2 => "zh",  :alpha3 => "chi"},     # Chinese
    %{:alpha2 => "",    :alpha3 => "chk"},     # Chuukese
    %{:alpha2 => "",    :alpha3 => "chm"},     # Mari
    %{:alpha2 => "",    :alpha3 => "chn"},     # Chinook jargon
    %{:alpha2 => "",    :alpha3 => "cho"},     # Choctaw
    %{:alpha2 => "",    :alpha3 => "chp"},     # Chipewyan; Dene Suline
    %{:alpha2 => "",    :alpha3 => "chr"},     # Cherokee
    %{:alpha2 => "cu",  :alpha3 => "chu"},     # Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic
    %{:alpha2 => "cv",  :alpha3 => "chv"},     # Chuvash
    %{:alpha2 => "",    :alpha3 => "chy"},     # Cheyenne
    %{:alpha2 => "",    :alpha3 => "cmc"},     # Chamic languages
    %{:alpha2 => "",    :alpha3 => "cnr"},     # Montenegrin
    %{:alpha2 => "",    :alpha3 => "cop"},     # Coptic
    %{:alpha2 => "kw",  :alpha3 => "cor"},     # Cornish
    %{:alpha2 => "co",  :alpha3 => "cos"},     # Corsican
    %{:alpha2 => "",    :alpha3 => "cpe"},     # Creoles and pidgins, English based
    %{:alpha2 => "",    :alpha3 => "cpf"},     # Creoles and pidgins, French-based
    %{:alpha2 => "",    :alpha3 => "cpp"},     # Creoles and pidgins, Portuguese-based
    %{:alpha2 => "cr",  :alpha3 => "cre"},     # Cree
    %{:alpha2 => "",    :alpha3 => "crh"},     # Crimean Tatar; Crimean Turkish
    %{:alpha2 => "",    :alpha3 => "crp"},     # Creoles and pidgins
    %{:alpha2 => "",    :alpha3 => "csb"},     # Kashubian
    %{:alpha2 => "",    :alpha3 => "cus"},     # Cushitic languages
    %{:alpha2 => "cs",  :alpha3 => "cze"},     # Czech
    %{:alpha2 => "",    :alpha3 => "dak"},     # Dakota
    %{:alpha2 => "da",  :alpha3 => "dan"},     # Danish
    %{:alpha2 => "",    :alpha3 => "dar"},     # Dargwa
    %{:alpha2 => "",    :alpha3 => "day"},     # Land Dayak languages
    %{:alpha2 => "",    :alpha3 => "del"},     # Delaware
    %{:alpha2 => "",    :alpha3 => "den"},     # Slave - Athapascan
    %{:alpha2 => "",    :alpha3 => "dgr"},     # Dogrib
    %{:alpha2 => "",    :alpha3 => "din"},     # Dinka
    %{:alpha2 => "dv",  :alpha3 => "div"},     # Divehi; Dhivehi; Maldivian
    %{:alpha2 => "",    :alpha3 => "doi"},     # Dogri
    %{:alpha2 => "",    :alpha3 => "dra"},     # Dravidian languages
    %{:alpha2 => "",    :alpha3 => "dsb"},     # Lower Sorbian
    %{:alpha2 => "",    :alpha3 => "dua"},     # Duala
    %{:alpha2 => "",    :alpha3 => "dum"},     # Dutch, Middle - ca.1050-1350
    %{:alpha2 => "nl",  :alpha3 => "dut"},     # Dutch; Flemish
    %{:alpha2 => "",    :alpha3 => "dyu"},     # Dyula
    %{:alpha2 => "dz",  :alpha3 => "dzo"},     # Dzongkha
    %{:alpha2 => "",    :alpha3 => "efi"},     # Efik
    %{:alpha2 => "",    :alpha3 => "egy"},     # Egyptian - Ancient
    %{:alpha2 => "",    :alpha3 => "eka"},     # Ekajuk
    %{:alpha2 => "",    :alpha3 => "elx"},     # Elamite
    %{:alpha2 => "en",  :alpha3 => "eng"},     # English
    %{:alpha2 => "",    :alpha3 => "enm"},     # English, Middle - 1100-1500
    %{:alpha2 => "eo",  :alpha3 => "epo"},     # Esperanto
    %{:alpha2 => "et",  :alpha3 => "est"},     # Estonian
    %{:alpha2 => "ee",  :alpha3 => "ewe"},     # Ewe
    %{:alpha2 => "",    :alpha3 => "ewo"},     # Ewondo
    %{:alpha2 => "",    :alpha3 => "fan"},     # Fang
    %{:alpha2 => "fo",  :alpha3 => "fao"},     # Faroese
    %{:alpha2 => "",    :alpha3 => "fat"},     # Fanti
    %{:alpha2 => "fj",  :alpha3 => "fij"},     # Fijian
    %{:alpha2 => "",    :alpha3 => "fil"},     # Filipino; Pilipino
    %{:alpha2 => "fi",  :alpha3 => "fin"},     # Finnish
    %{:alpha2 => "",    :alpha3 => "fiu"},     # Finno-Ugrian languages
    %{:alpha2 => "",    :alpha3 => "fon"},     # Fon
    %{:alpha2 => "fr",  :alpha3 => "fre"},     # French
    %{:alpha2 => "",    :alpha3 => "frm"},     # French, Middle - ca.1400-1600
    %{:alpha2 => "",    :alpha3 => "fro"},     # French, Old - 842-ca.1400
    %{:alpha2 => "",    :alpha3 => "frr"},     # Northern Frisian
    %{:alpha2 => "",    :alpha3 => "frs"},     # Eastern Frisian
    %{:alpha2 => "fy",  :alpha3 => "fry"},     # Western Frisian
    %{:alpha2 => "ff",  :alpha3 => "ful"},     # Fulah
    %{:alpha2 => "",    :alpha3 => "fur"},     # Friulian
    %{:alpha2 => "",    :alpha3 => "gaa"},     # Ga
    %{:alpha2 => "",    :alpha3 => "gay"},     # Gayo
    %{:alpha2 => "",    :alpha3 => "gba"},     # Gbaya
    %{:alpha2 => "",    :alpha3 => "gem"},     # Germanic languages
    %{:alpha2 => "ka",  :alpha3 => "geo"},     # Georgian
    %{:alpha2 => "de",  :alpha3 => "ger"},     # German
    %{:alpha2 => "",    :alpha3 => "gez"},     # Geez
    %{:alpha2 => "",    :alpha3 => "gil"},     # Gilbertese
    %{:alpha2 => "gd",  :alpha3 => "gla"},     # Gaelic; Scottish Gaelic
    %{:alpha2 => "ga",  :alpha3 => "gle"},     # Irish
    %{:alpha2 => "gl",  :alpha3 => "glg"},     # Galician
    %{:alpha2 => "gv",  :alpha3 => "glv"},     # Manx
    %{:alpha2 => "",    :alpha3 => "gmh"},     # German, Middle High - ca.1050-1500
    %{:alpha2 => "",    :alpha3 => "goh"},     # German, Old High - ca.750-1050
    %{:alpha2 => "",    :alpha3 => "gon"},     # Gondi
    %{:alpha2 => "",    :alpha3 => "gor"},     # Gorontalo
    %{:alpha2 => "",    :alpha3 => "got"},     # Gothic
    %{:alpha2 => "",    :alpha3 => "grb"},     # Grebo
    %{:alpha2 => "",    :alpha3 => "grc"},     # Greek, Ancient - to 1453
    %{:alpha2 => "el",  :alpha3 => "gre"},     # Greek, Modern - 1453-
    %{:alpha2 => "gn",  :alpha3 => "grn"},     # Guarani
    %{:alpha2 => "",    :alpha3 => "gsw"},     # Swiss German; Alemannic; Alsatian
    %{:alpha2 => "gu",  :alpha3 => "guj"},     # Gujarati
    %{:alpha2 => "",    :alpha3 => "gwi"},     # Gwich"in
    %{:alpha2 => "",    :alpha3 => "hai"},     # Haida
    %{:alpha2 => "ht",  :alpha3 => "hat"},     # Haitian; Haitian Creole
    %{:alpha2 => "ha",  :alpha3 => "hau"},     # Hausa
    %{:alpha2 => "",    :alpha3 => "haw"},     # Hawaiian
    %{:alpha2 => "he",  :alpha3 => "heb"},     # Hebrew
    %{:alpha2 => "hz",  :alpha3 => "her"},     # Herero
    %{:alpha2 => "",    :alpha3 => "hil"},     # Hiligaynon
    %{:alpha2 => "",    :alpha3 => "him"},     # Himachali languages; Western Pahari languages
    %{:alpha2 => "hi",  :alpha3 => "hin"},     # Hindi
    %{:alpha2 => "",    :alpha3 => "hit"},     # Hittite
    %{:alpha2 => "",    :alpha3 => "hmn"},     # Hmong; Mong
    %{:alpha2 => "ho",  :alpha3 => "hmo"},     # Hiri Motu
    %{:alpha2 => "hr",  :alpha3 => "hrv"},     # Croatian
    %{:alpha2 => "",    :alpha3 => "hsb"},     # Upper Sorbian
    %{:alpha2 => "hu",  :alpha3 => "hun"},     # Hungarian
    %{:alpha2 => "",    :alpha3 => "hup"},     # Hupa
    %{:alpha2 => "",    :alpha3 => "iba"},     # Iban
    %{:alpha2 => "ig",  :alpha3 => "ibo"},     # Igbo
    %{:alpha2 => "is",  :alpha3 => "ice"},     # Icelandic
    %{:alpha2 => "io",  :alpha3 => "ido"},     # Ido
    %{:alpha2 => "ii",  :alpha3 => "iii"},     # Sichuan Yi; Nuosu
    %{:alpha2 => "",    :alpha3 => "ijo"},     # Ijo languages
    %{:alpha2 => "iu",  :alpha3 => "iku"},     # Inuktitut
    %{:alpha2 => "ie",  :alpha3 => "ile"},     # Interlingue; Occidental
    %{:alpha2 => "",    :alpha3 => "ilo"},     # Iloko
    %{:alpha2 => "ia",  :alpha3 => "ina"},     # Interlingua - International Auxiliary Language Association
    %{:alpha2 => "",    :alpha3 => "inc"},     # Indic languages
    %{:alpha2 => "id",  :alpha3 => "ind"},     # Indonesian
    %{:alpha2 => "",    :alpha3 => "ine"},     # Indo-European languages
    %{:alpha2 => "",    :alpha3 => "inh"},     # Ingush
    %{:alpha2 => "ik",  :alpha3 => "ipk"},     # Inupiaq
    %{:alpha2 => "",    :alpha3 => "ira"},     # Iranian languages
    %{:alpha2 => "",    :alpha3 => "iro"},     # Iroquoian languages
    %{:alpha2 => "it",  :alpha3 => "ita"},     # Italian
    %{:alpha2 => "jv",  :alpha3 => "jav"},     # Javanese
    %{:alpha2 => "",    :alpha3 => "jbo"},     # Lojban
    %{:alpha2 => "ja",  :alpha3 => "jpn"},     # Japanese
    %{:alpha2 => "",    :alpha3 => "jpr"},     # Judeo-Persian
    %{:alpha2 => "",    :alpha3 => "jrb"},     # Judeo-Arabic
    %{:alpha2 => "",    :alpha3 => "kaa"},     # Kara-Kalpak
    %{:alpha2 => "",    :alpha3 => "kab"},     # Kabyle
    %{:alpha2 => "",    :alpha3 => "kac"},     # Kachin; Jingpho
    %{:alpha2 => "kl",  :alpha3 => "kal"},     # Kalaallisut; Greenlandic
    %{:alpha2 => "",    :alpha3 => "kam"},     # Kamba
    %{:alpha2 => "kn",  :alpha3 => "kan"},     # Kannada
    %{:alpha2 => "",    :alpha3 => "kar"},     # Karen languages
    %{:alpha2 => "ks",  :alpha3 => "kas"},     # Kashmiri
    %{:alpha2 => "kr",  :alpha3 => "kau"},     # Kanuri
    %{:alpha2 => "",    :alpha3 => "kaw"},     # Kawi
    %{:alpha2 => "kk",  :alpha3 => "kaz"},     # Kazakh
    %{:alpha2 => "",    :alpha3 => "kbd"},     # Kabardian
    %{:alpha2 => "",    :alpha3 => "kha"},     # Khasi
    %{:alpha2 => "",    :alpha3 => "khi"},     # Khoisan languages
    %{:alpha2 => "km",  :alpha3 => "khm"},     # Central Khmer
    %{:alpha2 => "",    :alpha3 => "kho"},     # Khotanese; Sakan
    %{:alpha2 => "ki",  :alpha3 => "kik"},     # Kikuyu; Gikuyu
    %{:alpha2 => "rw",  :alpha3 => "kin"},     # Kinyarwanda
    %{:alpha2 => "ky",  :alpha3 => "kir"},     # Kirghiz; Kyrgyz
    %{:alpha2 => "",    :alpha3 => "kmb"},     # Kimbundu
    %{:alpha2 => "",    :alpha3 => "kok"},     # Konkani
    %{:alpha2 => "kv",  :alpha3 => "kom"},     # Komi
    %{:alpha2 => "kg",  :alpha3 => "kon"},     # Kongo
    %{:alpha2 => "ko",  :alpha3 => "kor"},     # Korean
    %{:alpha2 => "",    :alpha3 => "kos"},     # Kosraean
    %{:alpha2 => "",    :alpha3 => "kpe"},     # Kpelle
    %{:alpha2 => "",    :alpha3 => "krc"},     # Karachay-Balkar
    %{:alpha2 => "",    :alpha3 => "krl"},     # Karelian
    %{:alpha2 => "",    :alpha3 => "kro"},     # Kru languages
    %{:alpha2 => "",    :alpha3 => "kru"},     # Kurukh
    %{:alpha2 => "kj",  :alpha3 => "kua"},     # Kuanyama; Kwanyama
    %{:alpha2 => "",    :alpha3 => "kum"},     # Kumyk
    %{:alpha2 => "ku",  :alpha3 => "kur"},     # Kurdish
    %{:alpha2 => "",    :alpha3 => "kut"},     # Kutenai
    %{:alpha2 => "",    :alpha3 => "lad"},     # Ladino
    %{:alpha2 => "",    :alpha3 => "lah"},     # Lahnda
    %{:alpha2 => "",    :alpha3 => "lam"},     # Lamba
    %{:alpha2 => "lo",  :alpha3 => "lao"},     # Lao
    %{:alpha2 => "la",  :alpha3 => "lat"},     # Latin
    %{:alpha2 => "lv",  :alpha3 => "lav"},     # Latvian
    %{:alpha2 => "",    :alpha3 => "lez"},     # Lezghian
    %{:alpha2 => "li",  :alpha3 => "lim"},     # Limburgan; Limburger; Limburgish
    %{:alpha2 => "ln",  :alpha3 => "lin"},     # Lingala
    %{:alpha2 => "lt",  :alpha3 => "lit"},     # Lithuanian
    %{:alpha2 => "",    :alpha3 => "lol"},     # Mongo
    %{:alpha2 => "",    :alpha3 => "loz"},     # Lozi
    %{:alpha2 => "lb",  :alpha3 => "ltz"},     # Luxembourgish; Letzeburgesch
    %{:alpha2 => "",    :alpha3 => "lua"},     # Luba-Lulua
    %{:alpha2 => "lu",  :alpha3 => "lub"},     # Luba-Katanga
    %{:alpha2 => "lg",  :alpha3 => "lug"},     # Ganda
    %{:alpha2 => "",    :alpha3 => "lui"},     # Luiseno
    %{:alpha2 => "",    :alpha3 => "lun"},     # Lunda
    %{:alpha2 => "",    :alpha3 => "luo"},     # Luo - Kenya and Tanzania
    %{:alpha2 => "",    :alpha3 => "lus"},     # Lushai
    %{:alpha2 => "mk",  :alpha3 => "mac"},     # Macedonian
    %{:alpha2 => "",    :alpha3 => "mad"},     # Madurese
    %{:alpha2 => "",    :alpha3 => "mag"},     # Magahi
    %{:alpha2 => "mh",  :alpha3 => "mah"},     # Marshallese
    %{:alpha2 => "",    :alpha3 => "mai"},     # Maithili
    %{:alpha2 => "",    :alpha3 => "mak"},     # Makasar
    %{:alpha2 => "ml",  :alpha3 => "mal"},     # Malayalam
    %{:alpha2 => "",    :alpha3 => "man"},     # Mandingo
    %{:alpha2 => "mi",  :alpha3 => "mao"},     # Maori
    %{:alpha2 => "",    :alpha3 => "map"},     # Austronesian languages
    %{:alpha2 => "mr",  :alpha3 => "mar"},     # Marathi
    %{:alpha2 => "",    :alpha3 => "mas"},     # Masai
    %{:alpha2 => "ms",  :alpha3 => "may"},     # Malay
    %{:alpha2 => "",    :alpha3 => "mdf"},     # Moksha
    %{:alpha2 => "",    :alpha3 => "mdr"},     # Mandar
    %{:alpha2 => "",    :alpha3 => "men"},     # Mende
    %{:alpha2 => "",    :alpha3 => "mga"},     # Irish, Middle - 900-1200
    %{:alpha2 => "",    :alpha3 => "mic"},     # Mi"kmaq; Micmac
    %{:alpha2 => "",    :alpha3 => "min"},     # Minangkabau
    %{:alpha2 => "",    :alpha3 => "mis"},     # Uncoded languages
    %{:alpha2 => "",    :alpha3 => "mkh"},     # Mon-Khmer languages
    %{:alpha2 => "mg",  :alpha3 => "mlg"},     # Malagasy
    %{:alpha2 => "mt",  :alpha3 => "mlt"},     # Maltese
    %{:alpha2 => "",    :alpha3 => "mnc"},     # Manchu
    %{:alpha2 => "",    :alpha3 => "mni"},     # Manipuri
    %{:alpha2 => "",    :alpha3 => "mno"},     # Manobo languages
    %{:alpha2 => "",    :alpha3 => "moh"},     # Mohawk
    %{:alpha2 => "mn",  :alpha3 => "mon"},     # Mongolian
    %{:alpha2 => "",    :alpha3 => "mos"},     # Mossi
    %{:alpha2 => "",    :alpha3 => "mul"},     # Multiple languages
    %{:alpha2 => "",    :alpha3 => "mun"},     # Munda languages
    %{:alpha2 => "",    :alpha3 => "mus"},     # Creek
    %{:alpha2 => "",    :alpha3 => "mwl"},     # Mirandese
    %{:alpha2 => "",    :alpha3 => "mwr"},     # Marwari
    %{:alpha2 => "",    :alpha3 => "myn"},     # Mayan languages
    %{:alpha2 => "",    :alpha3 => "myv"},     # Erzya
    %{:alpha2 => "",    :alpha3 => "nah"},     # Nahuatl languages
    %{:alpha2 => "",    :alpha3 => "nai"},     # North American Indian languages
    %{:alpha2 => "",    :alpha3 => "nap"},     # Neapolitan
    %{:alpha2 => "na",  :alpha3 => "nau"},     # Nauru
    %{:alpha2 => "nv",  :alpha3 => "nav"},     # Navajo; Navaho
    %{:alpha2 => "nr",  :alpha3 => "nbl"},     # Ndebele, South; South Ndebele
    %{:alpha2 => "nd",  :alpha3 => "nde"},     # Ndebele, North; North Ndebele
    %{:alpha2 => "ng",  :alpha3 => "ndo"},     # Ndonga
    %{:alpha2 => "",    :alpha3 => "nds"},     # Low German; Low Saxon; German, Low; Saxon, Low
    %{:alpha2 => "ne",  :alpha3 => "nep"},     # Nepali
    %{:alpha2 => "",    :alpha3 => "new"},     # Nepal Bhasa; Newari
    %{:alpha2 => "",    :alpha3 => "nia"},     # Nias
    %{:alpha2 => "",    :alpha3 => "nic"},     # Niger-Kordofanian languages
    %{:alpha2 => "",    :alpha3 => "niu"},     # Niuean
    %{:alpha2 => "nn",  :alpha3 => "nno"},     # Norwegian Nynorsk; Nynorsk, Norwegian
    %{:alpha2 => "nb",  :alpha3 => "nob"},     # Bokmål, Norwegian; Norwegian Bokmål
    %{:alpha2 => "",    :alpha3 => "nog"},     # Nogai
    %{:alpha2 => "",    :alpha3 => "non"},     # Norse, Old
    %{:alpha2 => "no",  :alpha3 => "nor"},     # Norwegian
    %{:alpha2 => "",    :alpha3 => "nqo"},     # N"Ko
    %{:alpha2 => "",    :alpha3 => "nso"},     # Pedi; Sepedi; Northern Sotho
    %{:alpha2 => "",    :alpha3 => "nub"},     # Nubian languages
    %{:alpha2 => "",    :alpha3 => "nwc"},     # Classical Newari; Old Newari; Classical Nepal Bhasa
    %{:alpha2 => "ny",  :alpha3 => "nya"},     # Chichewa; Chewa; Nyanja
    %{:alpha2 => "",    :alpha3 => "nym"},     # Nyamwezi
    %{:alpha2 => "",    :alpha3 => "nyn"},     # Nyankole
    %{:alpha2 => "",    :alpha3 => "nyo"},     # Nyoro
    %{:alpha2 => "",    :alpha3 => "nzi"},     # Nzima
    %{:alpha2 => "oc",  :alpha3 => "oci"},     # Occitan - post 1500); Provença
    %{:alpha2 => "oj",  :alpha3 => "oji"},     # Ojibwa
    %{:alpha2 => "or",  :alpha3 => "ori"},     # Oriya
    %{:alpha2 => "om",  :alpha3 => "orm"},     # Oromo
    %{:alpha2 => "",    :alpha3 => "osa"},     # Osage
    %{:alpha2 => "os",  :alpha3 => "oss"},     # Ossetian; Ossetic
    %{:alpha2 => "",    :alpha3 => "ota"},     # Turkish, Ottoman - 1500-1928
    %{:alpha2 => "",    :alpha3 => "oto"},     # Otomian languages
    %{:alpha2 => "",    :alpha3 => "paa"},     # Papuan languages
    %{:alpha2 => "",    :alpha3 => "pag"},     # Pangasinan
    %{:alpha2 => "",    :alpha3 => "pal"},     # Pahlavi
    %{:alpha2 => "",    :alpha3 => "pam"},     # Pampanga; Kapampangan
    %{:alpha2 => "pa",  :alpha3 => "pan"},     # Panjabi; Punjabi
    %{:alpha2 => "",    :alpha3 => "pap"},     # Papiamento
    %{:alpha2 => "",    :alpha3 => "pau"},     # Palauan
    %{:alpha2 => "",    :alpha3 => "peo"},     # Persian, Old - ca.600-400 B.C.
    %{:alpha2 => "fa",  :alpha3 => "per"},     # Persian
    %{:alpha2 => "",    :alpha3 => "phi"},     # Philippine languages
    %{:alpha2 => "",    :alpha3 => "phn"},     # Phoenician
    %{:alpha2 => "pi",  :alpha3 => "pli"},     # Pali
    %{:alpha2 => "pl",  :alpha3 => "pol"},     # Polish
    %{:alpha2 => "",    :alpha3 => "pon"},     # Pohnpeian
    %{:alpha2 => "pt",  :alpha3 => "por"},     # Portuguese
    %{:alpha2 => "",    :alpha3 => "pra"},     # Prakrit languages
    %{:alpha2 => "",    :alpha3 => "pro"},     # Provençal, Old - to 1500
    %{:alpha2 => "ps",  :alpha3 => "pus"},     # Pushto; Pashto
    %{:alpha2 => "",    :alpha3 => "qaaqtz"},  # Reserved for local use
    %{:alpha2 => "qu",  :alpha3 => "que"},     # Quechua
    %{:alpha2 => "",    :alpha3 => "raj"},     # Rajasthani
    %{:alpha2 => "",    :alpha3 => "rap"},     # Rapanui
    %{:alpha2 => "",    :alpha3 => "rar"},     # Rarotongan; Cook Islands Maori
    %{:alpha2 => "",    :alpha3 => "roa"},     # Romance languages
    %{:alpha2 => "rm",  :alpha3 => "roh"},     # Romansh
    %{:alpha2 => "",    :alpha3 => "rom"},     # Romany
    %{:alpha2 => "ro",  :alpha3 => "rum"},     # Romanian; Moldavian; Moldovan
    %{:alpha2 => "rn",  :alpha3 => "run"},     # Rundi
    %{:alpha2 => "",    :alpha3 => "rup"},     # Aromanian; Arumanian; Macedo-Romanian
    %{:alpha2 => "ru",  :alpha3 => "rus"},     # Russian
    %{:alpha2 => "",    :alpha3 => "sad"},     # Sandawe
    %{:alpha2 => "sg",  :alpha3 => "sag"},     # Sango
    %{:alpha2 => "",    :alpha3 => "sah"},     # Yakut
    %{:alpha2 => "",    :alpha3 => "sai"},     # South American Indian - Other
    %{:alpha2 => "",    :alpha3 => "sal"},     # Salishan languages
    %{:alpha2 => "",    :alpha3 => "sam"},     # Samaritan Aramaic
    %{:alpha2 => "sa",  :alpha3 => "san"},     # Sanskrit
    %{:alpha2 => "",    :alpha3 => "sas"},     # Sasak
    %{:alpha2 => "",    :alpha3 => "sat"},     # Santali
    %{:alpha2 => "",    :alpha3 => "scn"},     # Sicilian
    %{:alpha2 => "",    :alpha3 => "sco"},     # Scots
    %{:alpha2 => "",    :alpha3 => "sel"},     # Selkup
    %{:alpha2 => "",    :alpha3 => "sem"},     # Semitic languages
    %{:alpha2 => "",    :alpha3 => "sga"},     # Irish, Old - to 900
    %{:alpha2 => "",    :alpha3 => "sgn"},     # Sign Languages
    %{:alpha2 => "",    :alpha3 => "shn"},     # Shan
    %{:alpha2 => "",    :alpha3 => "sid"},     # Sidamo
    %{:alpha2 => "si",  :alpha3 => "sin"},     # Sinhala; Sinhalese
    %{:alpha2 => "",    :alpha3 => "sio"},     # Siouan languages
    %{:alpha2 => "",    :alpha3 => "sit"},     # Sino-Tibetan languages
    %{:alpha2 => "",    :alpha3 => "sla"},     # Slavic languages
    %{:alpha2 => "sk",  :alpha3 => "slo"},     # Slovak
    %{:alpha2 => "sl",  :alpha3 => "slv"},     # Slovenian
    %{:alpha2 => "",    :alpha3 => "sma"},     # Southern Sami
    %{:alpha2 => "se",  :alpha3 => "sme"},     # Northern Sami
    %{:alpha2 => "",    :alpha3 => "smi"},     # Sami languages
    %{:alpha2 => "",    :alpha3 => "smj"},     # Lule Sami
    %{:alpha2 => "",    :alpha3 => "smn"},     # Inari Sami
    %{:alpha2 => "sm",  :alpha3 => "smo"},     # Samoan
    %{:alpha2 => "",    :alpha3 => "sms"},     # Skolt Sami
    %{:alpha2 => "sn",  :alpha3 => "sna"},     # Shona
    %{:alpha2 => "sd",  :alpha3 => "snd"},     # Sindhi
    %{:alpha2 => "",    :alpha3 => "snk"},     # Soninke
    %{:alpha2 => "",    :alpha3 => "sog"},     # Sogdian
    %{:alpha2 => "so",  :alpha3 => "som"},     # Somali
    %{:alpha2 => "",    :alpha3 => "son"},     # Songhai languages
    %{:alpha2 => "st",  :alpha3 => "sot"},     # Sotho, Southern
    %{:alpha2 => "es",  :alpha3 => "spa"},     # Spanish; Castilian
    %{:alpha2 => "sc",  :alpha3 => "srd"},     # Sardinian
    %{:alpha2 => "",    :alpha3 => "srn"},     # Sranan Tongo
    %{:alpha2 => "sr",  :alpha3 => "srp"},     # Serbian
    %{:alpha2 => "",    :alpha3 => "srr"},     # Serer
    %{:alpha2 => "",    :alpha3 => "ssa"},     # Nilo-Saharan languages
    %{:alpha2 => "ss",  :alpha3 => "ssw"},     # Swati
    %{:alpha2 => "",    :alpha3 => "suk"},     # Sukuma
    %{:alpha2 => "su",  :alpha3 => "sun"},     # Sundanese
    %{:alpha2 => "",    :alpha3 => "sus"},     # Susu
    %{:alpha2 => "",    :alpha3 => "sux"},     # Sumerian
    %{:alpha2 => "sw",  :alpha3 => "swa"},     # Swahili
    %{:alpha2 => "sv",  :alpha3 => "swe"},     # Swedish
    %{:alpha2 => "",    :alpha3 => "syc"},     # Classical Syriac
    %{:alpha2 => "",    :alpha3 => "syr"},     # Syriac
    %{:alpha2 => "ty",  :alpha3 => "tah"},     # Tahitian
    %{:alpha2 => "",    :alpha3 => "tai"},     # Tai languages
    %{:alpha2 => "ta",  :alpha3 => "tam"},     # Tamil
    %{:alpha2 => "tt",  :alpha3 => "tat"},     # Tatar
    %{:alpha2 => "te",  :alpha3 => "tel"},     # Telugu
    %{:alpha2 => "",    :alpha3 => "tem"},     # Timne
    %{:alpha2 => "",    :alpha3 => "ter"},     # Tereno
    %{:alpha2 => "",    :alpha3 => "tet"},     # Tetum
    %{:alpha2 => "tg",  :alpha3 => "tgk"},     # Tajik
    %{:alpha2 => "tl",  :alpha3 => "tgl"},     # Tagalog
    %{:alpha2 => "th",  :alpha3 => "tha"},     # Thai
    %{:alpha2 => "bo",  :alpha3 => "tib"},     # Tibetan
    %{:alpha2 => "",    :alpha3 => "tig"},     # Tigre
    %{:alpha2 => "ti",  :alpha3 => "tir"},     # Tigrinya
    %{:alpha2 => "",    :alpha3 => "tiv"},     # Tiv
    %{:alpha2 => "",    :alpha3 => "tkl"},     # Tokelau
    %{:alpha2 => "",    :alpha3 => "tlh"},     # Klingon; tlhIngan-Hol
    %{:alpha2 => "",    :alpha3 => "tli"},     # Tlingit
    %{:alpha2 => "",    :alpha3 => "tmh"},     # Tamashek
    %{:alpha2 => "",    :alpha3 => "tog"},     # Tonga - Nyasa
    %{:alpha2 => "to",  :alpha3 => "ton"},     # Tonga - Tonga Islands
    %{:alpha2 => "",    :alpha3 => "tpi"},     # Tok Pisin
    %{:alpha2 => "",    :alpha3 => "tsi"},     # Tsimshian
    %{:alpha2 => "tn",  :alpha3 => "tsn"},     # Tswana
    %{:alpha2 => "ts",  :alpha3 => "tso"},     # Tsonga
    %{:alpha2 => "tk",  :alpha3 => "tuk"},     # Turkmen
    %{:alpha2 => "",    :alpha3 => "tum"},     # Tumbuka
    %{:alpha2 => "",    :alpha3 => "tup"},     # Tupi languages
    %{:alpha2 => "tr",  :alpha3 => "tur"},     # Turkish
    %{:alpha2 => "",    :alpha3 => "tut"},     # Altaic languages
    %{:alpha2 => "",    :alpha3 => "tvl"},     # Tuvalu
    %{:alpha2 => "tw",  :alpha3 => "twi"},     # Twi
    %{:alpha2 => "",    :alpha3 => "tyv"},     # Tuvinian
    %{:alpha2 => "",    :alpha3 => "udm"},     # Udmurt
    %{:alpha2 => "",    :alpha3 => "uga"},     # Ugaritic
    %{:alpha2 => "ug",  :alpha3 => "uig"},     # Uighur; Uyghur
    %{:alpha2 => "uk",  :alpha3 => "ukr"},     # Ukrainian
    %{:alpha2 => "",    :alpha3 => "umb"},     # Umbundu
    %{:alpha2 => "",    :alpha3 => "und"},     # Undetermined
    %{:alpha2 => "ur",  :alpha3 => "urd"},     # Urdu
    %{:alpha2 => "uz",  :alpha3 => "uzb"},     # Uzbek
    %{:alpha2 => "",    :alpha3 => "vai"},     # Vai
    %{:alpha2 => "ve",  :alpha3 => "ven"},     # Venda
    %{:alpha2 => "vi",  :alpha3 => "vie"},     # Vietnamese
    %{:alpha2 => "vo",  :alpha3 => "vol"},     # Volapük
    %{:alpha2 => "",    :alpha3 => "vot"},     # Votic
    %{:alpha2 => "",    :alpha3 => "wak"},     # Wakashan languages
    %{:alpha2 => "",    :alpha3 => "wal"},     # Walamo
    %{:alpha2 => "",    :alpha3 => "war"},     # Waray
    %{:alpha2 => "",    :alpha3 => "was"},     # Washo
    %{:alpha2 => "cy",  :alpha3 => "wel"},     # Welsh
    %{:alpha2 => "",    :alpha3 => "wen"},     # Sorbian languages
    %{:alpha2 => "wa",  :alpha3 => "wln"},     # Walloon
    %{:alpha2 => "wo",  :alpha3 => "wol"},     # Wolof
    %{:alpha2 => "",    :alpha3 => "xal"},     # Kalmyk; Oirat
    %{:alpha2 => "xh",  :alpha3 => "xho"},     # Xhosa
    %{:alpha2 => "",    :alpha3 => "yao"},     # Yao
    %{:alpha2 => "",    :alpha3 => "yap"},     # Yapese
    %{:alpha2 => "yi",  :alpha3 => "yid"},     # Yiddish
    %{:alpha2 => "yo",  :alpha3 => "yor"},     # Yoruba
    %{:alpha2 => "",    :alpha3 => "ypk"},     # Yupik languages
    %{:alpha2 => "",    :alpha3 => "zap"},     # Zapotec
    %{:alpha2 => "",    :alpha3 => "zbl"},     # Blissymbols; Blissymbolics; Bliss
    %{:alpha2 => "",    :alpha3 => "zen"},     # Zenaga
    %{:alpha2 => "",    :alpha3 => "zgh"},     # Standard Moroccan Tamazight
    %{:alpha2 => "za",  :alpha3 => "zha"},     # Zhuang; Chuang
    %{:alpha2 => "",    :alpha3 => "znd"},     # Zande languages
    %{:alpha2 => "zu",  :alpha3 => "zul"},     # Zulu
    %{:alpha2 => "",    :alpha3 => "zun"},     # Zuni
    %{:alpha2 => "",    :alpha3 => "zxx"},     # No linguistic content; Not applicable
  ]

  @spec validate(String.t, atom) :: boolean
  def validate(input, type \\ :alpha2) when is_binary(input) and is_atom(type) do
    if String.length(input) >= 1 do
      unless Enum.member?([:alpha2, :alpha3], type) do
        raise "Invalid type param. It should be either: :alpha2 or :alpha3."
      end

      result =
        Enum.find(@language_codes, fn language_code ->
          language_code[type] == input
        end)

      result != nil
    else
      false
    end
  end
end

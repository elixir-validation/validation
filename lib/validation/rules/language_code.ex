defmodule Validation.Rules.LanguageCode do
  @moduledoc false

  @language_codes [
    # Afar
    %{:alpha2 => "aa", :alpha3 => "aar"},
    # Abkhazian
    %{:alpha2 => "ab", :alpha3 => "abk"},
    # Achinese
    %{:alpha2 => "", :alpha3 => "ace"},
    # Acoli
    %{:alpha2 => "", :alpha3 => "ach"},
    # Adangme
    %{:alpha2 => "", :alpha3 => "ada"},
    # Adyghe; Adygei
    %{:alpha2 => "", :alpha3 => "ady"},
    # Afro-Asiatic languages
    %{:alpha2 => "", :alpha3 => "afa"},
    # Afrihili
    %{:alpha2 => "", :alpha3 => "afh"},
    # Afrikaans
    %{:alpha2 => "af", :alpha3 => "afr"},
    # Ainu
    %{:alpha2 => "", :alpha3 => "ain"},
    # Akan
    %{:alpha2 => "ak", :alpha3 => "aka"},
    # Akkadian
    %{:alpha2 => "", :alpha3 => "akk"},
    # Albanian
    %{:alpha2 => "sq", :alpha3 => "alb"},
    # Aleut
    %{:alpha2 => "", :alpha3 => "ale"},
    # Algonquian languages
    %{:alpha2 => "", :alpha3 => "alg"},
    # Southern Altai
    %{:alpha2 => "", :alpha3 => "alt"},
    # Amharic
    %{:alpha2 => "am", :alpha3 => "amh"},
    # English, Old (ca.450-1100)
    %{:alpha2 => "", :alpha3 => "ang"},
    # Angika
    %{:alpha2 => "", :alpha3 => "anp"},
    # Apache languages
    %{:alpha2 => "", :alpha3 => "apa"},
    # Arabic
    %{:alpha2 => "ar", :alpha3 => "ara"},
    # Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)
    %{:alpha2 => "", :alpha3 => "arc"},
    # Aragonese
    %{:alpha2 => "an", :alpha3 => "arg"},
    # Armenian
    %{:alpha2 => "hy", :alpha3 => "arm"},
    # Mapudungun; Mapuche
    %{:alpha2 => "", :alpha3 => "arn"},
    # Arapaho
    %{:alpha2 => "", :alpha3 => "arp"},
    # Artificial languages
    %{:alpha2 => "", :alpha3 => "art"},
    # Arawak
    %{:alpha2 => "", :alpha3 => "arw"},
    # Assamese
    %{:alpha2 => "as", :alpha3 => "asm"},
    # Asturian; Bable; Leonese; Asturleonese
    %{:alpha2 => "", :alpha3 => "ast"},
    # Athapascan languages
    %{:alpha2 => "", :alpha3 => "ath"},
    # Australian languages
    %{:alpha2 => "", :alpha3 => "aus"},
    # Avaric
    %{:alpha2 => "av", :alpha3 => "ava"},
    # Avestan
    %{:alpha2 => "ae", :alpha3 => "ave"},
    # Awadhi
    %{:alpha2 => "", :alpha3 => "awa"},
    # Aymara
    %{:alpha2 => "ay", :alpha3 => "aym"},
    # Azerbaijani
    %{:alpha2 => "az", :alpha3 => "aze"},
    # Banda languages
    %{:alpha2 => "", :alpha3 => "bad"},
    # Bamileke languages
    %{:alpha2 => "", :alpha3 => "bai"},
    # Bashkir
    %{:alpha2 => "ba", :alpha3 => "bak"},
    # Baluchi
    %{:alpha2 => "", :alpha3 => "bal"},
    # Bambara
    %{:alpha2 => "bm", :alpha3 => "bam"},
    # Balinese
    %{:alpha2 => "", :alpha3 => "ban"},
    # Basque
    %{:alpha2 => "eu", :alpha3 => "baq"},
    # Basa
    %{:alpha2 => "", :alpha3 => "bas"},
    # Baltic languages
    %{:alpha2 => "", :alpha3 => "bat"},
    # Beja; Bedawiyet
    %{:alpha2 => "", :alpha3 => "bej"},
    # Belarusian
    %{:alpha2 => "be", :alpha3 => "bel"},
    # Bemba
    %{:alpha2 => "", :alpha3 => "bem"},
    # Bengali
    %{:alpha2 => "bn", :alpha3 => "ben"},
    # Berber languages
    %{:alpha2 => "", :alpha3 => "ber"},
    # Bhojpuri
    %{:alpha2 => "", :alpha3 => "bho"},
    # Bihari languages
    %{:alpha2 => "bh", :alpha3 => "bih"},
    # Bikol
    %{:alpha2 => "", :alpha3 => "bik"},
    # Bini; Edo
    %{:alpha2 => "", :alpha3 => "bin"},
    # Bislama
    %{:alpha2 => "bi", :alpha3 => "bis"},
    # Siksika
    %{:alpha2 => "", :alpha3 => "bla"},
    # Bantu - Other
    %{:alpha2 => "", :alpha3 => "bnt"},
    # Bosnian
    %{:alpha2 => "bs", :alpha3 => "bos"},
    # Braj
    %{:alpha2 => "", :alpha3 => "bra"},
    # Breton
    %{:alpha2 => "br", :alpha3 => "bre"},
    # Batak languages
    %{:alpha2 => "", :alpha3 => "btk"},
    # Buriat
    %{:alpha2 => "", :alpha3 => "bua"},
    # Buginese
    %{:alpha2 => "", :alpha3 => "bug"},
    # Bulgarian
    %{:alpha2 => "bg", :alpha3 => "bul"},
    # Burmese
    %{:alpha2 => "my", :alpha3 => "bur"},
    # Blin; Bilin
    %{:alpha2 => "", :alpha3 => "byn"},
    # Caddo
    %{:alpha2 => "", :alpha3 => "cad"},
    # Central American Indian languages
    %{:alpha2 => "", :alpha3 => "cai"},
    # Galibi Carib
    %{:alpha2 => "", :alpha3 => "car"},
    # Catalan; Valencian
    %{:alpha2 => "ca", :alpha3 => "cat"},
    # Caucasian languages
    %{:alpha2 => "", :alpha3 => "cau"},
    # Cebuano
    %{:alpha2 => "", :alpha3 => "ceb"},
    # Celtic languages
    %{:alpha2 => "", :alpha3 => "cel"},
    # Chamorro
    %{:alpha2 => "ch", :alpha3 => "cha"},
    # Chibcha
    %{:alpha2 => "", :alpha3 => "chb"},
    # Chechen
    %{:alpha2 => "ce", :alpha3 => "che"},
    # Chagatai
    %{:alpha2 => "", :alpha3 => "chg"},
    # Chinese
    %{:alpha2 => "zh", :alpha3 => "chi"},
    # Chuukese
    %{:alpha2 => "", :alpha3 => "chk"},
    # Mari
    %{:alpha2 => "", :alpha3 => "chm"},
    # Chinook jargon
    %{:alpha2 => "", :alpha3 => "chn"},
    # Choctaw
    %{:alpha2 => "", :alpha3 => "cho"},
    # Chipewyan; Dene Suline
    %{:alpha2 => "", :alpha3 => "chp"},
    # Cherokee
    %{:alpha2 => "", :alpha3 => "chr"},
    # Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic
    %{:alpha2 => "cu", :alpha3 => "chu"},
    # Chuvash
    %{:alpha2 => "cv", :alpha3 => "chv"},
    # Cheyenne
    %{:alpha2 => "", :alpha3 => "chy"},
    # Chamic languages
    %{:alpha2 => "", :alpha3 => "cmc"},
    # Montenegrin
    %{:alpha2 => "", :alpha3 => "cnr"},
    # Coptic
    %{:alpha2 => "", :alpha3 => "cop"},
    # Cornish
    %{:alpha2 => "kw", :alpha3 => "cor"},
    # Corsican
    %{:alpha2 => "co", :alpha3 => "cos"},
    # Creoles and pidgins, English based
    %{:alpha2 => "", :alpha3 => "cpe"},
    # Creoles and pidgins, French-based
    %{:alpha2 => "", :alpha3 => "cpf"},
    # Creoles and pidgins, Portuguese-based
    %{:alpha2 => "", :alpha3 => "cpp"},
    # Cree
    %{:alpha2 => "cr", :alpha3 => "cre"},
    # Crimean Tatar; Crimean Turkish
    %{:alpha2 => "", :alpha3 => "crh"},
    # Creoles and pidgins
    %{:alpha2 => "", :alpha3 => "crp"},
    # Kashubian
    %{:alpha2 => "", :alpha3 => "csb"},
    # Cushitic languages
    %{:alpha2 => "", :alpha3 => "cus"},
    # Czech
    %{:alpha2 => "cs", :alpha3 => "cze"},
    # Dakota
    %{:alpha2 => "", :alpha3 => "dak"},
    # Danish
    %{:alpha2 => "da", :alpha3 => "dan"},
    # Dargwa
    %{:alpha2 => "", :alpha3 => "dar"},
    # Land Dayak languages
    %{:alpha2 => "", :alpha3 => "day"},
    # Delaware
    %{:alpha2 => "", :alpha3 => "del"},
    # Slave - Athapascan
    %{:alpha2 => "", :alpha3 => "den"},
    # Dogrib
    %{:alpha2 => "", :alpha3 => "dgr"},
    # Dinka
    %{:alpha2 => "", :alpha3 => "din"},
    # Divehi; Dhivehi; Maldivian
    %{:alpha2 => "dv", :alpha3 => "div"},
    # Dogri
    %{:alpha2 => "", :alpha3 => "doi"},
    # Dravidian languages
    %{:alpha2 => "", :alpha3 => "dra"},
    # Lower Sorbian
    %{:alpha2 => "", :alpha3 => "dsb"},
    # Duala
    %{:alpha2 => "", :alpha3 => "dua"},
    # Dutch, Middle - ca.1050-1350
    %{:alpha2 => "", :alpha3 => "dum"},
    # Dutch; Flemish
    %{:alpha2 => "nl", :alpha3 => "dut"},
    # Dyula
    %{:alpha2 => "", :alpha3 => "dyu"},
    # Dzongkha
    %{:alpha2 => "dz", :alpha3 => "dzo"},
    # Efik
    %{:alpha2 => "", :alpha3 => "efi"},
    # Egyptian - Ancient
    %{:alpha2 => "", :alpha3 => "egy"},
    # Ekajuk
    %{:alpha2 => "", :alpha3 => "eka"},
    # Elamite
    %{:alpha2 => "", :alpha3 => "elx"},
    # English
    %{:alpha2 => "en", :alpha3 => "eng"},
    # English, Middle - 1100-1500
    %{:alpha2 => "", :alpha3 => "enm"},
    # Esperanto
    %{:alpha2 => "eo", :alpha3 => "epo"},
    # Estonian
    %{:alpha2 => "et", :alpha3 => "est"},
    # Ewe
    %{:alpha2 => "ee", :alpha3 => "ewe"},
    # Ewondo
    %{:alpha2 => "", :alpha3 => "ewo"},
    # Fang
    %{:alpha2 => "", :alpha3 => "fan"},
    # Faroese
    %{:alpha2 => "fo", :alpha3 => "fao"},
    # Fanti
    %{:alpha2 => "", :alpha3 => "fat"},
    # Fijian
    %{:alpha2 => "fj", :alpha3 => "fij"},
    # Filipino; Pilipino
    %{:alpha2 => "", :alpha3 => "fil"},
    # Finnish
    %{:alpha2 => "fi", :alpha3 => "fin"},
    # Finno-Ugrian languages
    %{:alpha2 => "", :alpha3 => "fiu"},
    # Fon
    %{:alpha2 => "", :alpha3 => "fon"},
    # French
    %{:alpha2 => "fr", :alpha3 => "fre"},
    # French, Middle - ca.1400-1600
    %{:alpha2 => "", :alpha3 => "frm"},
    # French, Old - 842-ca.1400
    %{:alpha2 => "", :alpha3 => "fro"},
    # Northern Frisian
    %{:alpha2 => "", :alpha3 => "frr"},
    # Eastern Frisian
    %{:alpha2 => "", :alpha3 => "frs"},
    # Western Frisian
    %{:alpha2 => "fy", :alpha3 => "fry"},
    # Fulah
    %{:alpha2 => "ff", :alpha3 => "ful"},
    # Friulian
    %{:alpha2 => "", :alpha3 => "fur"},
    # Ga
    %{:alpha2 => "", :alpha3 => "gaa"},
    # Gayo
    %{:alpha2 => "", :alpha3 => "gay"},
    # Gbaya
    %{:alpha2 => "", :alpha3 => "gba"},
    # Germanic languages
    %{:alpha2 => "", :alpha3 => "gem"},
    # Georgian
    %{:alpha2 => "ka", :alpha3 => "geo"},
    # German
    %{:alpha2 => "de", :alpha3 => "ger"},
    # Geez
    %{:alpha2 => "", :alpha3 => "gez"},
    # Gilbertese
    %{:alpha2 => "", :alpha3 => "gil"},
    # Gaelic; Scottish Gaelic
    %{:alpha2 => "gd", :alpha3 => "gla"},
    # Irish
    %{:alpha2 => "ga", :alpha3 => "gle"},
    # Galician
    %{:alpha2 => "gl", :alpha3 => "glg"},
    # Manx
    %{:alpha2 => "gv", :alpha3 => "glv"},
    # German, Middle High - ca.1050-1500
    %{:alpha2 => "", :alpha3 => "gmh"},
    # German, Old High - ca.750-1050
    %{:alpha2 => "", :alpha3 => "goh"},
    # Gondi
    %{:alpha2 => "", :alpha3 => "gon"},
    # Gorontalo
    %{:alpha2 => "", :alpha3 => "gor"},
    # Gothic
    %{:alpha2 => "", :alpha3 => "got"},
    # Grebo
    %{:alpha2 => "", :alpha3 => "grb"},
    # Greek, Ancient - to 1453
    %{:alpha2 => "", :alpha3 => "grc"},
    # Greek, Modern - 1453-
    %{:alpha2 => "el", :alpha3 => "gre"},
    # Guarani
    %{:alpha2 => "gn", :alpha3 => "grn"},
    # Swiss German; Alemannic; Alsatian
    %{:alpha2 => "", :alpha3 => "gsw"},
    # Gujarati
    %{:alpha2 => "gu", :alpha3 => "guj"},
    # Gwich"in
    %{:alpha2 => "", :alpha3 => "gwi"},
    # Haida
    %{:alpha2 => "", :alpha3 => "hai"},
    # Haitian; Haitian Creole
    %{:alpha2 => "ht", :alpha3 => "hat"},
    # Hausa
    %{:alpha2 => "ha", :alpha3 => "hau"},
    # Hawaiian
    %{:alpha2 => "", :alpha3 => "haw"},
    # Hebrew
    %{:alpha2 => "he", :alpha3 => "heb"},
    # Herero
    %{:alpha2 => "hz", :alpha3 => "her"},
    # Hiligaynon
    %{:alpha2 => "", :alpha3 => "hil"},
    # Himachali languages; Western Pahari languages
    %{:alpha2 => "", :alpha3 => "him"},
    # Hindi
    %{:alpha2 => "hi", :alpha3 => "hin"},
    # Hittite
    %{:alpha2 => "", :alpha3 => "hit"},
    # Hmong; Mong
    %{:alpha2 => "", :alpha3 => "hmn"},
    # Hiri Motu
    %{:alpha2 => "ho", :alpha3 => "hmo"},
    # Croatian
    %{:alpha2 => "hr", :alpha3 => "hrv"},
    # Upper Sorbian
    %{:alpha2 => "", :alpha3 => "hsb"},
    # Hungarian
    %{:alpha2 => "hu", :alpha3 => "hun"},
    # Hupa
    %{:alpha2 => "", :alpha3 => "hup"},
    # Iban
    %{:alpha2 => "", :alpha3 => "iba"},
    # Igbo
    %{:alpha2 => "ig", :alpha3 => "ibo"},
    # Icelandic
    %{:alpha2 => "is", :alpha3 => "ice"},
    # Ido
    %{:alpha2 => "io", :alpha3 => "ido"},
    # Sichuan Yi; Nuosu
    %{:alpha2 => "ii", :alpha3 => "iii"},
    # Ijo languages
    %{:alpha2 => "", :alpha3 => "ijo"},
    # Inuktitut
    %{:alpha2 => "iu", :alpha3 => "iku"},
    # Interlingue; Occidental
    %{:alpha2 => "ie", :alpha3 => "ile"},
    # Iloko
    %{:alpha2 => "", :alpha3 => "ilo"},
    # Interlingua - International Auxiliary Language Association
    %{:alpha2 => "ia", :alpha3 => "ina"},
    # Indic languages
    %{:alpha2 => "", :alpha3 => "inc"},
    # Indonesian
    %{:alpha2 => "id", :alpha3 => "ind"},
    # Indo-European languages
    %{:alpha2 => "", :alpha3 => "ine"},
    # Ingush
    %{:alpha2 => "", :alpha3 => "inh"},
    # Inupiaq
    %{:alpha2 => "ik", :alpha3 => "ipk"},
    # Iranian languages
    %{:alpha2 => "", :alpha3 => "ira"},
    # Iroquoian languages
    %{:alpha2 => "", :alpha3 => "iro"},
    # Italian
    %{:alpha2 => "it", :alpha3 => "ita"},
    # Javanese
    %{:alpha2 => "jv", :alpha3 => "jav"},
    # Lojban
    %{:alpha2 => "", :alpha3 => "jbo"},
    # Japanese
    %{:alpha2 => "ja", :alpha3 => "jpn"},
    # Judeo-Persian
    %{:alpha2 => "", :alpha3 => "jpr"},
    # Judeo-Arabic
    %{:alpha2 => "", :alpha3 => "jrb"},
    # Kara-Kalpak
    %{:alpha2 => "", :alpha3 => "kaa"},
    # Kabyle
    %{:alpha2 => "", :alpha3 => "kab"},
    # Kachin; Jingpho
    %{:alpha2 => "", :alpha3 => "kac"},
    # Kalaallisut; Greenlandic
    %{:alpha2 => "kl", :alpha3 => "kal"},
    # Kamba
    %{:alpha2 => "", :alpha3 => "kam"},
    # Kannada
    %{:alpha2 => "kn", :alpha3 => "kan"},
    # Karen languages
    %{:alpha2 => "", :alpha3 => "kar"},
    # Kashmiri
    %{:alpha2 => "ks", :alpha3 => "kas"},
    # Kanuri
    %{:alpha2 => "kr", :alpha3 => "kau"},
    # Kawi
    %{:alpha2 => "", :alpha3 => "kaw"},
    # Kazakh
    %{:alpha2 => "kk", :alpha3 => "kaz"},
    # Kabardian
    %{:alpha2 => "", :alpha3 => "kbd"},
    # Khasi
    %{:alpha2 => "", :alpha3 => "kha"},
    # Khoisan languages
    %{:alpha2 => "", :alpha3 => "khi"},
    # Central Khmer
    %{:alpha2 => "km", :alpha3 => "khm"},
    # Khotanese; Sakan
    %{:alpha2 => "", :alpha3 => "kho"},
    # Kikuyu; Gikuyu
    %{:alpha2 => "ki", :alpha3 => "kik"},
    # Kinyarwanda
    %{:alpha2 => "rw", :alpha3 => "kin"},
    # Kirghiz; Kyrgyz
    %{:alpha2 => "ky", :alpha3 => "kir"},
    # Kimbundu
    %{:alpha2 => "", :alpha3 => "kmb"},
    # Konkani
    %{:alpha2 => "", :alpha3 => "kok"},
    # Komi
    %{:alpha2 => "kv", :alpha3 => "kom"},
    # Kongo
    %{:alpha2 => "kg", :alpha3 => "kon"},
    # Korean
    %{:alpha2 => "ko", :alpha3 => "kor"},
    # Kosraean
    %{:alpha2 => "", :alpha3 => "kos"},
    # Kpelle
    %{:alpha2 => "", :alpha3 => "kpe"},
    # Karachay-Balkar
    %{:alpha2 => "", :alpha3 => "krc"},
    # Karelian
    %{:alpha2 => "", :alpha3 => "krl"},
    # Kru languages
    %{:alpha2 => "", :alpha3 => "kro"},
    # Kurukh
    %{:alpha2 => "", :alpha3 => "kru"},
    # Kuanyama; Kwanyama
    %{:alpha2 => "kj", :alpha3 => "kua"},
    # Kumyk
    %{:alpha2 => "", :alpha3 => "kum"},
    # Kurdish
    %{:alpha2 => "ku", :alpha3 => "kur"},
    # Kutenai
    %{:alpha2 => "", :alpha3 => "kut"},
    # Ladino
    %{:alpha2 => "", :alpha3 => "lad"},
    # Lahnda
    %{:alpha2 => "", :alpha3 => "lah"},
    # Lamba
    %{:alpha2 => "", :alpha3 => "lam"},
    # Lao
    %{:alpha2 => "lo", :alpha3 => "lao"},
    # Latin
    %{:alpha2 => "la", :alpha3 => "lat"},
    # Latvian
    %{:alpha2 => "lv", :alpha3 => "lav"},
    # Lezghian
    %{:alpha2 => "", :alpha3 => "lez"},
    # Limburgan; Limburger; Limburgish
    %{:alpha2 => "li", :alpha3 => "lim"},
    # Lingala
    %{:alpha2 => "ln", :alpha3 => "lin"},
    # Lithuanian
    %{:alpha2 => "lt", :alpha3 => "lit"},
    # Mongo
    %{:alpha2 => "", :alpha3 => "lol"},
    # Lozi
    %{:alpha2 => "", :alpha3 => "loz"},
    # Luxembourgish; Letzeburgesch
    %{:alpha2 => "lb", :alpha3 => "ltz"},
    # Luba-Lulua
    %{:alpha2 => "", :alpha3 => "lua"},
    # Luba-Katanga
    %{:alpha2 => "lu", :alpha3 => "lub"},
    # Ganda
    %{:alpha2 => "lg", :alpha3 => "lug"},
    # Luiseno
    %{:alpha2 => "", :alpha3 => "lui"},
    # Lunda
    %{:alpha2 => "", :alpha3 => "lun"},
    # Luo - Kenya and Tanzania
    %{:alpha2 => "", :alpha3 => "luo"},
    # Lushai
    %{:alpha2 => "", :alpha3 => "lus"},
    # Macedonian
    %{:alpha2 => "mk", :alpha3 => "mac"},
    # Madurese
    %{:alpha2 => "", :alpha3 => "mad"},
    # Magahi
    %{:alpha2 => "", :alpha3 => "mag"},
    # Marshallese
    %{:alpha2 => "mh", :alpha3 => "mah"},
    # Maithili
    %{:alpha2 => "", :alpha3 => "mai"},
    # Makasar
    %{:alpha2 => "", :alpha3 => "mak"},
    # Malayalam
    %{:alpha2 => "ml", :alpha3 => "mal"},
    # Mandingo
    %{:alpha2 => "", :alpha3 => "man"},
    # Maori
    %{:alpha2 => "mi", :alpha3 => "mao"},
    # Austronesian languages
    %{:alpha2 => "", :alpha3 => "map"},
    # Marathi
    %{:alpha2 => "mr", :alpha3 => "mar"},
    # Masai
    %{:alpha2 => "", :alpha3 => "mas"},
    # Malay
    %{:alpha2 => "ms", :alpha3 => "may"},
    # Moksha
    %{:alpha2 => "", :alpha3 => "mdf"},
    # Mandar
    %{:alpha2 => "", :alpha3 => "mdr"},
    # Mende
    %{:alpha2 => "", :alpha3 => "men"},
    # Irish, Middle - 900-1200
    %{:alpha2 => "", :alpha3 => "mga"},
    # Mi"kmaq; Micmac
    %{:alpha2 => "", :alpha3 => "mic"},
    # Minangkabau
    %{:alpha2 => "", :alpha3 => "min"},
    # Uncoded languages
    %{:alpha2 => "", :alpha3 => "mis"},
    # Mon-Khmer languages
    %{:alpha2 => "", :alpha3 => "mkh"},
    # Malagasy
    %{:alpha2 => "mg", :alpha3 => "mlg"},
    # Maltese
    %{:alpha2 => "mt", :alpha3 => "mlt"},
    # Manchu
    %{:alpha2 => "", :alpha3 => "mnc"},
    # Manipuri
    %{:alpha2 => "", :alpha3 => "mni"},
    # Manobo languages
    %{:alpha2 => "", :alpha3 => "mno"},
    # Mohawk
    %{:alpha2 => "", :alpha3 => "moh"},
    # Mongolian
    %{:alpha2 => "mn", :alpha3 => "mon"},
    # Mossi
    %{:alpha2 => "", :alpha3 => "mos"},
    # Multiple languages
    %{:alpha2 => "", :alpha3 => "mul"},
    # Munda languages
    %{:alpha2 => "", :alpha3 => "mun"},
    # Creek
    %{:alpha2 => "", :alpha3 => "mus"},
    # Mirandese
    %{:alpha2 => "", :alpha3 => "mwl"},
    # Marwari
    %{:alpha2 => "", :alpha3 => "mwr"},
    # Mayan languages
    %{:alpha2 => "", :alpha3 => "myn"},
    # Erzya
    %{:alpha2 => "", :alpha3 => "myv"},
    # Nahuatl languages
    %{:alpha2 => "", :alpha3 => "nah"},
    # North American Indian languages
    %{:alpha2 => "", :alpha3 => "nai"},
    # Neapolitan
    %{:alpha2 => "", :alpha3 => "nap"},
    # Nauru
    %{:alpha2 => "na", :alpha3 => "nau"},
    # Navajo; Navaho
    %{:alpha2 => "nv", :alpha3 => "nav"},
    # Ndebele, South; South Ndebele
    %{:alpha2 => "nr", :alpha3 => "nbl"},
    # Ndebele, North; North Ndebele
    %{:alpha2 => "nd", :alpha3 => "nde"},
    # Ndonga
    %{:alpha2 => "ng", :alpha3 => "ndo"},
    # Low German; Low Saxon; German, Low; Saxon, Low
    %{:alpha2 => "", :alpha3 => "nds"},
    # Nepali
    %{:alpha2 => "ne", :alpha3 => "nep"},
    # Nepal Bhasa; Newari
    %{:alpha2 => "", :alpha3 => "new"},
    # Nias
    %{:alpha2 => "", :alpha3 => "nia"},
    # Niger-Kordofanian languages
    %{:alpha2 => "", :alpha3 => "nic"},
    # Niuean
    %{:alpha2 => "", :alpha3 => "niu"},
    # Norwegian Nynorsk; Nynorsk, Norwegian
    %{:alpha2 => "nn", :alpha3 => "nno"},
    # Bokmål, Norwegian; Norwegian Bokmål
    %{:alpha2 => "nb", :alpha3 => "nob"},
    # Nogai
    %{:alpha2 => "", :alpha3 => "nog"},
    # Norse, Old
    %{:alpha2 => "", :alpha3 => "non"},
    # Norwegian
    %{:alpha2 => "no", :alpha3 => "nor"},
    # N"Ko
    %{:alpha2 => "", :alpha3 => "nqo"},
    # Pedi; Sepedi; Northern Sotho
    %{:alpha2 => "", :alpha3 => "nso"},
    # Nubian languages
    %{:alpha2 => "", :alpha3 => "nub"},
    # Classical Newari; Old Newari; Classical Nepal Bhasa
    %{:alpha2 => "", :alpha3 => "nwc"},
    # Chichewa; Chewa; Nyanja
    %{:alpha2 => "ny", :alpha3 => "nya"},
    # Nyamwezi
    %{:alpha2 => "", :alpha3 => "nym"},
    # Nyankole
    %{:alpha2 => "", :alpha3 => "nyn"},
    # Nyoro
    %{:alpha2 => "", :alpha3 => "nyo"},
    # Nzima
    %{:alpha2 => "", :alpha3 => "nzi"},
    # Occitan - post 1500); Provença
    %{:alpha2 => "oc", :alpha3 => "oci"},
    # Ojibwa
    %{:alpha2 => "oj", :alpha3 => "oji"},
    # Oriya
    %{:alpha2 => "or", :alpha3 => "ori"},
    # Oromo
    %{:alpha2 => "om", :alpha3 => "orm"},
    # Osage
    %{:alpha2 => "", :alpha3 => "osa"},
    # Ossetian; Ossetic
    %{:alpha2 => "os", :alpha3 => "oss"},
    # Turkish, Ottoman - 1500-1928
    %{:alpha2 => "", :alpha3 => "ota"},
    # Otomian languages
    %{:alpha2 => "", :alpha3 => "oto"},
    # Papuan languages
    %{:alpha2 => "", :alpha3 => "paa"},
    # Pangasinan
    %{:alpha2 => "", :alpha3 => "pag"},
    # Pahlavi
    %{:alpha2 => "", :alpha3 => "pal"},
    # Pampanga; Kapampangan
    %{:alpha2 => "", :alpha3 => "pam"},
    # Panjabi; Punjabi
    %{:alpha2 => "pa", :alpha3 => "pan"},
    # Papiamento
    %{:alpha2 => "", :alpha3 => "pap"},
    # Palauan
    %{:alpha2 => "", :alpha3 => "pau"},
    # Persian, Old - ca.600-400 B.C.
    %{:alpha2 => "", :alpha3 => "peo"},
    # Persian
    %{:alpha2 => "fa", :alpha3 => "per"},
    # Philippine languages
    %{:alpha2 => "", :alpha3 => "phi"},
    # Phoenician
    %{:alpha2 => "", :alpha3 => "phn"},
    # Pali
    %{:alpha2 => "pi", :alpha3 => "pli"},
    # Polish
    %{:alpha2 => "pl", :alpha3 => "pol"},
    # Pohnpeian
    %{:alpha2 => "", :alpha3 => "pon"},
    # Portuguese
    %{:alpha2 => "pt", :alpha3 => "por"},
    # Prakrit languages
    %{:alpha2 => "", :alpha3 => "pra"},
    # Provençal, Old - to 1500
    %{:alpha2 => "", :alpha3 => "pro"},
    # Pushto; Pashto
    %{:alpha2 => "ps", :alpha3 => "pus"},
    # Reserved for local use
    %{:alpha2 => "", :alpha3 => "qaaqtz"},
    # Quechua
    %{:alpha2 => "qu", :alpha3 => "que"},
    # Rajasthani
    %{:alpha2 => "", :alpha3 => "raj"},
    # Rapanui
    %{:alpha2 => "", :alpha3 => "rap"},
    # Rarotongan; Cook Islands Maori
    %{:alpha2 => "", :alpha3 => "rar"},
    # Romance languages
    %{:alpha2 => "", :alpha3 => "roa"},
    # Romansh
    %{:alpha2 => "rm", :alpha3 => "roh"},
    # Romany
    %{:alpha2 => "", :alpha3 => "rom"},
    # Romanian; Moldavian; Moldovan
    %{:alpha2 => "ro", :alpha3 => "rum"},
    # Rundi
    %{:alpha2 => "rn", :alpha3 => "run"},
    # Aromanian; Arumanian; Macedo-Romanian
    %{:alpha2 => "", :alpha3 => "rup"},
    # Russian
    %{:alpha2 => "ru", :alpha3 => "rus"},
    # Sandawe
    %{:alpha2 => "", :alpha3 => "sad"},
    # Sango
    %{:alpha2 => "sg", :alpha3 => "sag"},
    # Yakut
    %{:alpha2 => "", :alpha3 => "sah"},
    # South American Indian - Other
    %{:alpha2 => "", :alpha3 => "sai"},
    # Salishan languages
    %{:alpha2 => "", :alpha3 => "sal"},
    # Samaritan Aramaic
    %{:alpha2 => "", :alpha3 => "sam"},
    # Sanskrit
    %{:alpha2 => "sa", :alpha3 => "san"},
    # Sasak
    %{:alpha2 => "", :alpha3 => "sas"},
    # Santali
    %{:alpha2 => "", :alpha3 => "sat"},
    # Sicilian
    %{:alpha2 => "", :alpha3 => "scn"},
    # Scots
    %{:alpha2 => "", :alpha3 => "sco"},
    # Selkup
    %{:alpha2 => "", :alpha3 => "sel"},
    # Semitic languages
    %{:alpha2 => "", :alpha3 => "sem"},
    # Irish, Old - to 900
    %{:alpha2 => "", :alpha3 => "sga"},
    # Sign Languages
    %{:alpha2 => "", :alpha3 => "sgn"},
    # Shan
    %{:alpha2 => "", :alpha3 => "shn"},
    # Sidamo
    %{:alpha2 => "", :alpha3 => "sid"},
    # Sinhala; Sinhalese
    %{:alpha2 => "si", :alpha3 => "sin"},
    # Siouan languages
    %{:alpha2 => "", :alpha3 => "sio"},
    # Sino-Tibetan languages
    %{:alpha2 => "", :alpha3 => "sit"},
    # Slavic languages
    %{:alpha2 => "", :alpha3 => "sla"},
    # Slovak
    %{:alpha2 => "sk", :alpha3 => "slo"},
    # Slovenian
    %{:alpha2 => "sl", :alpha3 => "slv"},
    # Southern Sami
    %{:alpha2 => "", :alpha3 => "sma"},
    # Northern Sami
    %{:alpha2 => "se", :alpha3 => "sme"},
    # Sami languages
    %{:alpha2 => "", :alpha3 => "smi"},
    # Lule Sami
    %{:alpha2 => "", :alpha3 => "smj"},
    # Inari Sami
    %{:alpha2 => "", :alpha3 => "smn"},
    # Samoan
    %{:alpha2 => "sm", :alpha3 => "smo"},
    # Skolt Sami
    %{:alpha2 => "", :alpha3 => "sms"},
    # Shona
    %{:alpha2 => "sn", :alpha3 => "sna"},
    # Sindhi
    %{:alpha2 => "sd", :alpha3 => "snd"},
    # Soninke
    %{:alpha2 => "", :alpha3 => "snk"},
    # Sogdian
    %{:alpha2 => "", :alpha3 => "sog"},
    # Somali
    %{:alpha2 => "so", :alpha3 => "som"},
    # Songhai languages
    %{:alpha2 => "", :alpha3 => "son"},
    # Sotho, Southern
    %{:alpha2 => "st", :alpha3 => "sot"},
    # Spanish; Castilian
    %{:alpha2 => "es", :alpha3 => "spa"},
    # Sardinian
    %{:alpha2 => "sc", :alpha3 => "srd"},
    # Sranan Tongo
    %{:alpha2 => "", :alpha3 => "srn"},
    # Serbian
    %{:alpha2 => "sr", :alpha3 => "srp"},
    # Serer
    %{:alpha2 => "", :alpha3 => "srr"},
    # Nilo-Saharan languages
    %{:alpha2 => "", :alpha3 => "ssa"},
    # Swati
    %{:alpha2 => "ss", :alpha3 => "ssw"},
    # Sukuma
    %{:alpha2 => "", :alpha3 => "suk"},
    # Sundanese
    %{:alpha2 => "su", :alpha3 => "sun"},
    # Susu
    %{:alpha2 => "", :alpha3 => "sus"},
    # Sumerian
    %{:alpha2 => "", :alpha3 => "sux"},
    # Swahili
    %{:alpha2 => "sw", :alpha3 => "swa"},
    # Swedish
    %{:alpha2 => "sv", :alpha3 => "swe"},
    # Classical Syriac
    %{:alpha2 => "", :alpha3 => "syc"},
    # Syriac
    %{:alpha2 => "", :alpha3 => "syr"},
    # Tahitian
    %{:alpha2 => "ty", :alpha3 => "tah"},
    # Tai languages
    %{:alpha2 => "", :alpha3 => "tai"},
    # Tamil
    %{:alpha2 => "ta", :alpha3 => "tam"},
    # Tatar
    %{:alpha2 => "tt", :alpha3 => "tat"},
    # Telugu
    %{:alpha2 => "te", :alpha3 => "tel"},
    # Timne
    %{:alpha2 => "", :alpha3 => "tem"},
    # Tereno
    %{:alpha2 => "", :alpha3 => "ter"},
    # Tetum
    %{:alpha2 => "", :alpha3 => "tet"},
    # Tajik
    %{:alpha2 => "tg", :alpha3 => "tgk"},
    # Tagalog
    %{:alpha2 => "tl", :alpha3 => "tgl"},
    # Thai
    %{:alpha2 => "th", :alpha3 => "tha"},
    # Tibetan
    %{:alpha2 => "bo", :alpha3 => "tib"},
    # Tigre
    %{:alpha2 => "", :alpha3 => "tig"},
    # Tigrinya
    %{:alpha2 => "ti", :alpha3 => "tir"},
    # Tiv
    %{:alpha2 => "", :alpha3 => "tiv"},
    # Tokelau
    %{:alpha2 => "", :alpha3 => "tkl"},
    # Klingon; tlhIngan-Hol
    %{:alpha2 => "", :alpha3 => "tlh"},
    # Tlingit
    %{:alpha2 => "", :alpha3 => "tli"},
    # Tamashek
    %{:alpha2 => "", :alpha3 => "tmh"},
    # Tonga - Nyasa
    %{:alpha2 => "", :alpha3 => "tog"},
    # Tonga - Tonga Islands
    %{:alpha2 => "to", :alpha3 => "ton"},
    # Tok Pisin
    %{:alpha2 => "", :alpha3 => "tpi"},
    # Tsimshian
    %{:alpha2 => "", :alpha3 => "tsi"},
    # Tswana
    %{:alpha2 => "tn", :alpha3 => "tsn"},
    # Tsonga
    %{:alpha2 => "ts", :alpha3 => "tso"},
    # Turkmen
    %{:alpha2 => "tk", :alpha3 => "tuk"},
    # Tumbuka
    %{:alpha2 => "", :alpha3 => "tum"},
    # Tupi languages
    %{:alpha2 => "", :alpha3 => "tup"},
    # Turkish
    %{:alpha2 => "tr", :alpha3 => "tur"},
    # Altaic languages
    %{:alpha2 => "", :alpha3 => "tut"},
    # Tuvalu
    %{:alpha2 => "", :alpha3 => "tvl"},
    # Twi
    %{:alpha2 => "tw", :alpha3 => "twi"},
    # Tuvinian
    %{:alpha2 => "", :alpha3 => "tyv"},
    # Udmurt
    %{:alpha2 => "", :alpha3 => "udm"},
    # Ugaritic
    %{:alpha2 => "", :alpha3 => "uga"},
    # Uighur; Uyghur
    %{:alpha2 => "ug", :alpha3 => "uig"},
    # Ukrainian
    %{:alpha2 => "uk", :alpha3 => "ukr"},
    # Umbundu
    %{:alpha2 => "", :alpha3 => "umb"},
    # Undetermined
    %{:alpha2 => "", :alpha3 => "und"},
    # Urdu
    %{:alpha2 => "ur", :alpha3 => "urd"},
    # Uzbek
    %{:alpha2 => "uz", :alpha3 => "uzb"},
    # Vai
    %{:alpha2 => "", :alpha3 => "vai"},
    # Venda
    %{:alpha2 => "ve", :alpha3 => "ven"},
    # Vietnamese
    %{:alpha2 => "vi", :alpha3 => "vie"},
    # Volapük
    %{:alpha2 => "vo", :alpha3 => "vol"},
    # Votic
    %{:alpha2 => "", :alpha3 => "vot"},
    # Wakashan languages
    %{:alpha2 => "", :alpha3 => "wak"},
    # Walamo
    %{:alpha2 => "", :alpha3 => "wal"},
    # Waray
    %{:alpha2 => "", :alpha3 => "war"},
    # Washo
    %{:alpha2 => "", :alpha3 => "was"},
    # Welsh
    %{:alpha2 => "cy", :alpha3 => "wel"},
    # Sorbian languages
    %{:alpha2 => "", :alpha3 => "wen"},
    # Walloon
    %{:alpha2 => "wa", :alpha3 => "wln"},
    # Wolof
    %{:alpha2 => "wo", :alpha3 => "wol"},
    # Kalmyk; Oirat
    %{:alpha2 => "", :alpha3 => "xal"},
    # Xhosa
    %{:alpha2 => "xh", :alpha3 => "xho"},
    # Yao
    %{:alpha2 => "", :alpha3 => "yao"},
    # Yapese
    %{:alpha2 => "", :alpha3 => "yap"},
    # Yiddish
    %{:alpha2 => "yi", :alpha3 => "yid"},
    # Yoruba
    %{:alpha2 => "yo", :alpha3 => "yor"},
    # Yupik languages
    %{:alpha2 => "", :alpha3 => "ypk"},
    # Zapotec
    %{:alpha2 => "", :alpha3 => "zap"},
    # Blissymbols; Blissymbolics; Bliss
    %{:alpha2 => "", :alpha3 => "zbl"},
    # Zenaga
    %{:alpha2 => "", :alpha3 => "zen"},
    # Standard Moroccan Tamazight
    %{:alpha2 => "", :alpha3 => "zgh"},
    # Zhuang; Chuang
    %{:alpha2 => "za", :alpha3 => "zha"},
    # Zande languages
    %{:alpha2 => "", :alpha3 => "znd"},
    # Zulu
    %{:alpha2 => "zu", :alpha3 => "zul"},
    # Zuni
    %{:alpha2 => "", :alpha3 => "zun"},
    # No linguistic content; Not applicable
    %{:alpha2 => "", :alpha3 => "zxx"}
  ]

  @spec validate?(String.t(), atom) :: boolean
  def validate?(input, type \\ :alpha2) when is_binary(input) and is_atom(type) do
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

<img width="250" src="https://github.com/elixir-validation/validation/raw/master/media/logo-readme.png" alt="Elixir Validation">

---

[![Build Status](https://travis-ci.org/elixir-validation/validation.svg?branch=master)](https://travis-ci.org/elixir-validation/validation)

<!-- @TODO: add travis and code coverage here -->
<!-- [![Build Status](http://img.shields.io/travis/zenorocha/clipboard.js/master.svg?style=flat)](https://travis-ci.org/zenorocha/clipboard.js) -->
<!-- ![Killing Flash](https://img.shields.io/badge/killing-flash-brightgreen.svg?style=flat) -->

> **Easy. Simple. Powerful. 💪**
>
> Elixir Validation library with +25 fully tested rules. *(+30 coming up soon!)*
>
> ⚠️⚠️⚠️ Library under development! Upcoming new rules: <!-- @TODO: update upcoming list here -->

# Demo

```elixir
# alias Validation, as: V

# valid data will return true
V.email("hello@gmail.com")
V.uuid("e4eaaaf2-d142-11e1-b3e4-080027620cdd")
V.credit_card("4882743696073832")
V.mac_address("12-77-0E-42-E4-65")
V.consonants("bcdfgh")
V.country_code("US")


# invalid data will return false
V.language_code("qq") # could be something like "en", "pt" or "de"
V.vowel("bcdf")       # could be something like "aeiou"
V.yes("nope")         # could be something like "yes", "yeah", "yeap"
V.is_odd(2)           # could be something like 3 or 5... 
```

## Install

To use Elixir Validation, please add to your `mix.exs` and run `mix deps.get`:

```elixir
def deps do
  [
    {:validation, "~> 0.0.1-dev"}
  ]
end
```

<!-- @TODO: update this -->
<!-- Compatibility: elixir 1.3+ --> 

## Documentation

To more information, please access the [full documention](http://google.com/). <!-- @TODO: update link -->

## Rules

+25 fully tested rules.

- [Email](http://google.com/)
- [CreditCard (Visa, Master, other)](http://google.com/)
- [IBAN](http://google.com/), [BarCode](http://google.com/) / [CNPJ](http://google.com/) / [CPF](http://google.com/)
- [CountryCode](http://google.com/) / [RegionCode](http://google.com/)
- [Vowels](http://google.com/) / [Consonants](http://google.com/)
- [IP](http://google.com/) / [MacAddress](http://google.com/)
- *... and many, many more [right here!](http://google.com/)*

# Contribution

[Check out the list of awesome contributors.](http://google.com/)

- *Do you want a new validation rule?* Feel free to contribute by forking the project and making a pull request.
- *Did you find a bug?* Please report on [issues](http://google.com)<!-- @TODO: update link --> proving high level of detail. Additionally, providing a failing test would help solve the issue.

# Inspiration

We highly appreciate ❤️ the [Respect\Validation](https://github.com/Respect/Validation) project. Elixir Validation was **completely** based upon this incredible project. Kudos for all contributors. We can't thank you enough.

## License

[MIT License](http://google.com) © Matheus Gontijo <!-- @TODO: update link -->

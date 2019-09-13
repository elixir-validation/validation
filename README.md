<img width="456" src="https://github.com/elixir-validation/validation/raw/master/media/logo-readme.png" alt="Elixir Validation">

---

[![Build Status](https://travis-ci.org/elixir-validation/validation.svg?branch=master)](https://travis-ci.org/elixir-validation/validation)
[![Build status](https://ci.appveyor.com/api/projects/status/xu5j5rrlx76hlcsu?svg=true)](https://ci.appveyor.com/project/elixir-validation/validation)
[![Coverage Status](https://coveralls.io/repos/github/elixir-validation/validation/badge.svg?branch=master)](https://coveralls.io/github/elixir-validation/validation?branch=master)
[![Inline docs](https://inch-ci.org/github/elixir-validation/validation.svg?branch=master)](https://inch-ci.org/github/elixir-validation/validation)
[![Hex Version](https://img.shields.io/hexpm/v/validation.svg)](https://hex.pm/packages/validation)
[![hex.pm downloads](https://img.shields.io/hexpm/dt/validation.svg)](https://hex.pm/packages/validation)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

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

To more information, please access the [full documention](https://hexdocs.pm/validation).

## Rules

##### +25 fully tested rules.

- [Email](https://hexdocs.pm/validation/Validation.html#email/1)
- [CreditCard (Visa, Master, other)](https://hexdocs.pm/validation/Validation.html#credit_card/1)
- [CNPJ](https://hexdocs.pm/validation/Validation.html#cnpj/1) / [CPF](https://hexdocs.pm/validation/Validation.html#cpf/1)
- [CountryCode](https://hexdocs.pm/validation/Validation.html#country_code/2) / [SubdivisionCode](https://hexdocs.pm/validation/Validation.html#subdivision_code/2)
- [Vowel](https://hexdocs.pm/validation/Validation.html#vowel/1) / [Consonants](https://hexdocs.pm/validation/Validation.html#consonant/1)
- [MacAddress](https://hexdocs.pm/validation/Validation.html#mac_address/1)
- *... and many, many more [right here!](https://hexdocs.pm/validation)*

<!--
##### Roadmap: +30 coming up soon!
- aaa
- bbb
- ccc
-->
<!-- @TODO: update roadmap list -->

# Contribution

[Check out the list of awesome contributors.](https://github.com/elixir-validation/validation/graphs/contributors)

- *Do you want a new validation rule?* Feel free to contribute by forking the project and making a pull request.
- *Did you find a bug?* Please report on [issues](https://github.com/elixir-validation/validation/issues) proving high level of detail. Additionally, providing a failing test would help solve the issue.

# Inspiration

We highly appreciate ❤️ the [Respect\Validation](https://github.com/Respect/Validation) project. Elixir Validation was **completely** based upon this incredible project. Kudos for all contributors. We can't thank you enough.

## License

[MIT License](https://github.com/elixir-validation/validation/blob/master/LICENSE.txt) © [Matheus Gontijo](https://github.com/matheusgontijo)

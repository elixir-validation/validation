<!-- @TODO: logo here -->

# Elixir Validation

<!-- @TODO: add travis and code coverage here -->
<!-- [![Build Status](http://img.shields.io/travis/zenorocha/clipboard.js/master.svg?style=flat)](https://travis-ci.org/zenorocha/clipboard.js) -->
<!-- ![Killing Flash](https://img.shields.io/badge/killing-flash-brightgreen.svg?style=flat) -->

> **Easy. Simple. Powerful. 💪**
> 👉 The best Elixir Validation library with +99<!-- @TODO: update this number --> fully tested rules.

# Demo

<!-- @TODO: update code examples -->

```elixir
defmodule Foo do
  alias Validation, as: V

  def bar do

  	# valid data will return {:ok}
  	V.email("hello@gmail.com")
  	V.credit_card("4882743696073832")
  	V.iban("DE89370400440532013000")
  	V.consonants("bcdfgh")
  	V.country_code("US")
  	V.mac_address("12-77-0E-42-E4-65")


  	# invalid data will return {:error, "error message"}
  	V.size("10GGG")            # could be something like "10G"
  	V.postcode.uk("88888888")  # could be something like "SW1A 2BJ"
  	V.is_odd(2)                # could be something like 3 or 5... 

  end
end
```

## Install

To use Elixir Validation, please add to your `mix.exs` and run `mix deps.get`:

```
def deps do
  [
    {:elixir_validation, "~> 0.1.0"}
  ]
end
```

- Compatibility:
  - Elixir 1.3+ <!-- @TODO: update this -->

## Documentation

To more information, please access the [full documention](http://google.com/). <!-- @TODO: update link -->

## Rules

+99 fully tested rules.

- [Email](http://google.com/)
- [Credit_card](http://google.com/)
- [IBAN](http://google.com/)
- [Country_code](http://google.com/)
- [Consonants](http://google.com/)
- [Mac Address](http://google.com/)
- *... and many, many more [right here](http://google.com/)*

# Contribution

[Check the list of contributors](http://google.com/)

- *Do you want a new validation rule?* Feel free to contribute by forking the project and making a pull request.
- *Did you find a bug?* Please report on the [issues](http://google.com)<!-- @TODO: update link --> proving high level of detail. Additionally, providing a failing test would help solve the issue.

# Inspiration

We highly appreciate the [Respect Validation](https://github.com/Respect/Validation) project. Elixir Validation was completely based upon this incredible project. Kudos for all contributors.

## License

[MIT License](http://google.com) © Matheus Gontijo <!-- @TODO: update link -->

defmodule Validation.MixProject do
  use Mix.Project

  @version "0.0.1-dev"

  def project do
    [
      app: :validation,
      version: "0.0.2-dev",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: "Validation library with +25 fully tested rules — Email, IBAN, Credit Card, UUID, MacAddress... and many more!",
      package: package(),

      # Docs
      name: "Validation",
      docs: docs(),

      # coveralls
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: ["Matheus Gontijo"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/elixir-validation/validation"}
    ]
  end

  defp deps do
    [
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:inch_ex, only: :docs},
      {:excoveralls, "~> 0.10", only: :test},
    ]
  end

  defp docs do
    [
      main: "Validation",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/validation",
      logo: "media/logo-docs.png",
      source_url: "https://github.com/elixir-validation/validation",
    ]
  end
end

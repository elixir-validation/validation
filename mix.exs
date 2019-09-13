defmodule Validation.MixProject do
  use Mix.Project

  @version "0.0.1-dev"

  def project do
    [
      app: :validation,
      version: "0.0.1-dev",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: "Elixir Validation library with +25 fully tested rules. (+30 coming up soon!) | Easy. Simple. Powerful. 💪",
      package: package(),

      # Docs
      name: "Validation",
      docs: docs(),

      # coveralls
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
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

  # Run "mix help deps" to learn about dependencies.
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

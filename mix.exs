defmodule Validation.MixProject do
  use Mix.Project

  def project do
    [
      app: :validation,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Elixir Validation",
      source_url: "https://github.com/elixir-validation/validation",
      homepage_url: "http://elixir-validation.com",
      docs: [
        main: "ElixirValidation",
        logo: "logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
    ]
  end
end

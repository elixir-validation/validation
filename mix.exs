defmodule Validation.MixProject do
  use Mix.Project

  @version "0.0.1-dev"

  def project do
    [
      app: :validation,
      version: "0.0.1-dev",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),

      # Docs
      name: "Elixir Validation",
      docs: docs(),
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
    ]
  end

  defp docs do
    [
      main: "Elixir Validation",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/validation",
      logo: "logo.png",
      source_url: "https://github.com/elixir-validation/validation",
    ]
  end
end

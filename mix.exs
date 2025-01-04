defmodule WebmaniaNfe.MixProject do
  use Mix.Project

  def project do
    [
      app: :webmania_nfe,
      version: "0.2.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "WebmaniaNfe",
      description: "WebmaniaNfe API SDK",
      source_url: "https://github.com/jonatanrdsantos/elixir-webmania-nfe-sdk",
      homepage_url: "https://github.com/jonatanrdsantos/elixir-webmania-nfe-sdk",
      package: [
        licenses: ["MIT"],
        links: %{
          "Documentation" => "https://webmaniabr.com/docs/rest-api-nfe/",
          "GitHub" => "https://github.com/jonatanrdsantos/elixir-webmania-nfe-sdk/"
        }
      ],
      docs: [
        main: "WebmaniaNfe",
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
      {:httpoison, "~> 2.1"},
      {:exconstructor, "~> 1.2.9"},
      {:poison, ">= 3.0.0 and <= 7.0.0"},
      {:ex_json_schema, "~> 0.10.1"},
      {:nestru, "~> 1.0"},
      {:domo, "~> 1.5"},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

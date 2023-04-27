defmodule Umbrella.Common.Deps do
  # Shared dependencies for phoenix projects
  def shared_phoenix_deps do
    ecto() ++
    phoenix_html() ++
    [
      {:phoenix, "~> 1.6.11"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_live_reload, "~> 1.3", only: :dev},
      {:jason, "~> 1.4"},
      {:plug_cowboy, "~> 2.5"},
      {:common, in_umbrella: true},
      {:assertions, "~> 0.18", only: :test},
    ]
  end

  def shared_authenticated_phoenix_deps do
    shared_phoenix_deps() ++
    [
      {:grenadier, in_umbrella: true},
    ]
  end

  def phoenix_html do
    [
      {:phoenix_html, "~> 3.2"},
      {:gettext, "~> 0.17"},
    ]
  end

  def ecto do
    [
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.8"},
      {:postgrex, ">= 0.0.0"},
    ]
  end

  def http_poison do
    {:httpoison, "~> 1.8"}
  end

  def floki do
    {:floki, "~> 0.33"}
  end

  def earmark do
    {:earmark, "~> 1.4"}
  end

  def argon2 do
    {:argon2_elixir, "~> 3.0"}
  end

  def telemetry do
    [
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:phoenix_live_view, "~> 0.17"},
    ]
  end
end

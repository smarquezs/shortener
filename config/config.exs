# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :shortener,
  ecto_repos: [Shortener.Repo]

# Configures the endpoint
config :shortener, ShortenerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "P2LVmnf9DT8rMsKC7GZku2zVabaQMpyy9D7qyLzqaoZ7NGSpCNmHLw1aM6GJtlCC",
  render_errors: [view: ShortenerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Shortener.PubSub,
  live_view: [signing_salt: "XExufbkf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

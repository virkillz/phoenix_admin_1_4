# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_admin,
  ecto_repos: [PhoenixAdmin.Repo]

# Configures the endpoint
config :phoenix_admin, PhoenixAdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+p4pb/yysCcTCWrshtLub4ELj7hjpbLwq1GNtU8lfF8aWs1TOGrKzKFfwRJmJIq7",
  render_errors: [view: PhoenixAdminWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixAdmin.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


# Configures Guardian
config :phoenix_admin, PhoenixAdmin.Auth.Guardian,
  issuer: "phoenix_admin",
  secret_key: "6FqTTEtPxCWf1Tc/JVjS/SRKE/e2a7JUi2GZynIHGhWZdgD49qzttvHQlEO93HLh"

config :phoenix_admin, PhoenixAdmin.Auth.AuthAccessPipeline,
  module: PhoenixAdmin.Auth.Guardian,
  error_handler: PhoenixAdmin.Auth.AuthErrorHandler



# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

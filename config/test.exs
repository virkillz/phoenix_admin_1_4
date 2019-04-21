use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_admin, PhoenixAdminWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_admin, PhoenixAdmin.Repo,
  username: "postgres",
  password: "postgres",
  database: "phoenix_admin_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

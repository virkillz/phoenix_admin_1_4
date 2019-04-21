defmodule PhoenixAdmin.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_admin,
    adapter: Ecto.Adapters.Postgres
end

defmodule PhoenixAdmin.Auth.Guardian do
  @moduledoc false

  use Guardian, otp_app: :phoenix_admin
  import Ecto.Query, warn: false

  alias PhoenixAdmin.Auth.Guardian
  alias PhoenixAdmin.Account

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    admin = Account.get_admin!(id)
    {:ok, admin}
  end

  def login(conn, admin) do
    conn
    |> Guardian.Plug.sign_in(admin)
    |> Plug.Conn.assign(:current_admin, admin)
  end

  def logout(conn) do
    conn
    |> Guardian.Plug.sign_out()
  end
end

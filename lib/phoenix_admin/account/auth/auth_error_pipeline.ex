defmodule PhoenixAdmin.Auth.AuthErrorHandler do
  @moduledoc false

  def auth_error(conn, {_type, _reason}, _opts) do
    Phoenix.Controller.redirect(conn, to: "/login")
    # body = Poison.encode!(%{message: to_string(type)})
    # send_resp(conn, 401, body)
  end
end

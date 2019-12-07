defmodule PhoenixAdminWeb.Plugs.SetCurrentAdmin do
  import Plug.Conn

  alias PhoenixAdmin.Repo
  alias PhoenixAdmin.Account.Admin

  def init(_params) do
  end

  def call(conn, _params) do
    IO.inspect(Plug.Conn.get_session(conn))
    user_id = Plug.Conn.get_session(conn, :current_admin_id) |> IO.inspect()

    cond do
      current_user = user_id && Repo.get(Admin, user_id) ->
        conn
        |> assign(:current_admin, current_user)
        |> assign(:admin_signed_in?, true)

      true ->
        conn
        |> assign(:current_admin, nil)
        |> assign(:admin_signed_in?, false)
    end
  end
end

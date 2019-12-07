defmodule PhoenixAdminWeb.PageController do
  use PhoenixAdminWeb, :controller

  alias PhoenixAdmin.Account
  alias PhoenixAdmin.Account.Admin
  alias PhoenixAdmin.Auth.Guardian

  def index(conn, _params) do
    IO.inspect(conn)

    conn
    |> render("index.html")
  end

  def login(conn, _params) do
    IO.inspect(Guardian.Plug.current_resource(conn))
    changeset = Account.change_admin(%Admin{})

    render(conn, "login.html",
      layout: {PhoenixAdminWeb.LayoutView, "app_login.html"},
      changeset: changeset
    )
  end

  def auth(conn, %{"username" => username, "password" => password}) do
    case Account.authenticate_admin(username, password) do
      {:ok, admin} ->
        conn
        |> put_session(:current_admin_id, admin.id)
        |> Guardian.login(admin)
        |> redirect(to: "/")

      {:error, reason} ->
        changeset = Account.change_admin(%Admin{})

        conn
        |> put_flash(:error, reason)
        |> render("login.html",
          layout: {PhoenixAdminWeb.LayoutView, "app_login.html"},
          changeset: changeset
        )
    end
  end

  def logout(conn, _) do
    conn
    |> Guardian.logout()
    |> redirect(to: "/login")
  end
end

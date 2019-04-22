defmodule PhoenixAdminWeb.Router do
  use PhoenixAdminWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PhoenixAdminWeb.Plugs.SetCurrentAdmin
  end

  pipeline :admin do
    plug(PhoenixAdmin.Auth.AuthAccessPipeline)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixAdminWeb do
    pipe_through([:browser,:admin])

    resources "/roles", RoleController
    resources "/admins", AdminController
    get "/", PageController, :index
    get "/logout", PageController, :logout        
  end

  scope "/", PhoenixAdminWeb do
    pipe_through :browser

    get "/login", PageController, :login
    post "/login", PageController, :auth       
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixAdminWeb do
  #   pipe_through :api
  # end
end

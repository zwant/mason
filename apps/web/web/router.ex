defmodule Mason.Web.Router do
  use Mason.Web.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Mason.Web, as: :api do
    pipe_through :api

    post "/commands", API.CommandController, :dispatch
  end

end

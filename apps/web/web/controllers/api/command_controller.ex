defmodule Mason.Web.API.CommandController do
  use Mason.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

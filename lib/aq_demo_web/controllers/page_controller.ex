defmodule AqDemoWeb.PageController do
  use AqDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

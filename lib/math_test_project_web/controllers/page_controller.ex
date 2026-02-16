defmodule MathTestProjectWeb.PageController do
  use MathTestProjectWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

defmodule BlogWeb.UsersController do
  use BlogWeb, :controller

  alias Blog.Users
  alias Blog.Users.User

  def create(conn, attrs) do
    with {:ok, %User{} = user} <- Users.create(attrs) do
      conn
      |> put_status(:created)
      |> json(user)
    end
  end

  def update(conn, %{"id" => id} = attrs) do
    with {:ok, %User{} = user} <- Users.update(id, attrs) do
      conn
      |> put_status(:ok)
      |> json(user)
    end
  end
end

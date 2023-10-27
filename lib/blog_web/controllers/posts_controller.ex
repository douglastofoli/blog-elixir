defmodule BlogWeb.PostsController do
  use BlogWeb, :controller

  alias Blog.Posts
  alias Blog.Posts.Post

  def create(conn, attrs) do
    with {:ok, %Post{} = post} <- Posts.create(attrs) do
      conn
      |> put_status(:created)
      |> json(post)
    end
  end
end

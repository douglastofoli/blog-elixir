defmodule Blog.Posts do
  alias Blog.Posts.Post
  alias Blog.Repo

  def get_by_id(id) do
    case Repo.get(Post, id) do
      nil -> {:error, :post_not_found}
      post -> {:ok, post}
    end
  end

  def create(attrs) do
    attrs
    |> Post.changeset()
    |> Repo.insert()
  end

  def delete(id) do
    case get_by_id(id) do
      {:error, _reason} = error -> error
      {:ok, %Post{} = post} -> Repo.delete(post)
    end
  end

  def add_like_to_post(id) do
    case get_by_id(id) do
      {:error, _reason} = error ->
        error

      {:ok, %Post{likes: likes} = post} ->
        post
        |> Post.change_likes(likes + 1)
        |> Repo.update()
    end
  end
end

defmodule Blog.Users do
  alias Blog.Repo
  alias Blog.Users.User

  def get_by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, :user_not_found}
      user -> {:ok, Repo.preload(user, :posts)}
    end
  end

  def create(attrs) do
    attrs
    |> User.changeset()
    |> Repo.insert()
  end

  def update(id, attrs) do
    case get_by_id(id) do
      {:error, _reason} = error -> error
      {:ok, %User{} = user} -> do_update(user, attrs)
    end
  end

  def delete(id) do
    case get_by_id(id) do
      {:error, _reason} = error -> error
      {:ok, %User{} = user} -> Repo.delete(user)
    end
  end

  defp do_update(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end
end

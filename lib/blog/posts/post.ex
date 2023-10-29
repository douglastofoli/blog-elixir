defmodule Blog.Posts.Post do
  use Ecto.Schema

  import Ecto.Changeset

  alias Blog.Users.User

  @required_fields [:content, :user_id]

  schema "posts" do
    field :content, :string
    field :likes, :integer, default: 0

    belongs_to :user, User

    timestamps()
  end

  def changeset(post \\ %__MODULE__{}, attrs) do
    post
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:content, min: 1, max: 280)
    |> foreign_key_constraint(:user_id)
  end

  def change_likes(post, likes) do
    change(post, likes: likes)
  end
end

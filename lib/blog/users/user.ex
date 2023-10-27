defmodule Blog.Users.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Blog.Posts.Post

  @required_fields ~w(username email age)a

  schema "users" do
    field :username, :string
    field :email, :string
    field :age, :integer

    has_many :posts, Post

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:username, min: 3)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end

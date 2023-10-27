defmodule Blog.Users.UserTest do
  use Blog.DataCase, async: true

  alias Blog.Users.User

  describe "changeset/2" do
    test "when all attrs are valids, returns a valid changeset" do
      attrs = %{username: "teste", email: "teste@teste.com", age: 20}

      response = User.changeset(attrs)

      assert %Ecto.Changeset{valid?: true} = response
    end

    test "when has invalid attrs, returns an invalid changeset" do
      attrs = %{username: "teste", email: "teste@teste.com", age: 16}

      response = User.changeset(attrs)

      assert %Ecto.Changeset{
               errors: [
                 age:
                   {"must be greater than or equal to %{number}",
                    [validation: :number, kind: :greater_than_or_equal_to, number: 18]}
               ],
               valid?: false
             } = response
    end
  end
end

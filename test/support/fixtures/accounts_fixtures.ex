defmodule AqDemo.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AqDemo.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> AqDemo.Accounts.create_user()

    user
  end
end

defmodule AqDemo.MarketFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AqDemo.Market` context.
  """

  @doc """
  Generate a unit.
  """
  def unit_fixture(attrs \\ %{}) do
    {:ok, unit} =
      attrs
      |> Enum.into(%{
        lat: 120.5,
        lon: 120.5,
        name: "some name"
      })
      |> AqDemo.Market.create_unit()

    unit
  end
end

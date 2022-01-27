defmodule AqDemo.MarketTest do
  use AqDemo.DataCase

  alias AqDemo.Market

  describe "units" do
    alias AqDemo.Market.Unit

    import AqDemo.MarketFixtures

    @invalid_attrs %{lat: nil, lon: nil, name: nil}

    test "list_units/0 returns all units" do
      unit = unit_fixture()
      assert Market.list_units() == [unit]
    end

    test "get_unit!/1 returns the unit with given id" do
      unit = unit_fixture()
      assert Market.get_unit!(unit.id) == unit
    end

    test "create_unit/1 with valid data creates a unit" do
      valid_attrs = %{lat: 120.5, lon: 120.5, name: "some name"}

      assert {:ok, %Unit{} = unit} = Market.create_unit(valid_attrs)
      assert unit.lat == 120.5
      assert unit.lon == 120.5
      assert unit.name == "some name"
    end

    test "create_unit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Market.create_unit(@invalid_attrs)
    end

    test "update_unit/2 with valid data updates the unit" do
      unit = unit_fixture()
      update_attrs = %{lat: 456.7, lon: 456.7, name: "some updated name"}

      assert {:ok, %Unit{} = unit} = Market.update_unit(unit, update_attrs)
      assert unit.lat == 456.7
      assert unit.lon == 456.7
      assert unit.name == "some updated name"
    end

    test "update_unit/2 with invalid data returns error changeset" do
      unit = unit_fixture()
      assert {:error, %Ecto.Changeset{}} = Market.update_unit(unit, @invalid_attrs)
      assert unit == Market.get_unit!(unit.id)
    end

    test "delete_unit/1 deletes the unit" do
      unit = unit_fixture()
      assert {:ok, %Unit{}} = Market.delete_unit(unit)
      assert_raise Ecto.NoResultsError, fn -> Market.get_unit!(unit.id) end
    end

    test "change_unit/1 returns a unit changeset" do
      unit = unit_fixture()
      assert %Ecto.Changeset{} = Market.change_unit(unit)
    end
  end
end

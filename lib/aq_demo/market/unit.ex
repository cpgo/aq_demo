defmodule AqDemo.Market.Unit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "units" do
    field :lat, :float
    field :lon, :float
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(unit, attrs) do
    unit
    |> cast(attrs, [:name, :lat, :lon])
    |> validate_required([:name, :lat, :lon])
  end
end

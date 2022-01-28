defmodule AqDemo.Market.Unit do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :lat, :lon]}
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
    |> validate_length(:name, min: 5, max: 10)
    |> my_custom_validation(:name)
  end

  def my_custom_validation(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, url ->
      case String.starts_with?(url, "bad") do
        false -> []
        true -> [{field, options[:message] || "Cannot start description with 'bad'"}]
      end
    end)
  end

end

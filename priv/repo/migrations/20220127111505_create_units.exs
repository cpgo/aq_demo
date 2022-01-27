defmodule AqDemo.Repo.Migrations.CreateUnits do
  use Ecto.Migration

  def change do
    create table(:units) do
      add :name, :string
      add :lat, :float
      add :lon, :float

      timestamps()
    end
  end
end

defmodule Hello.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string
      add :prev, :string
      add :status, :boolean, default: false, null: false

      timestamps()
    end

  end
end

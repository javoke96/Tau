defmodule Hello.Directory.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :name, :string
    field :prev, :string
    field :status, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name, :prev, :status])
    |> validate_required([:name, :status])
  end
end

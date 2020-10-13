defmodule FishingSpot.FishSpecies do
  use Ecto.Schema

  schema "fish_species" do
    field(:name, :string)
    timestamps()
  end
end

defmodule FishingSpot.FishLanded do
  alias FishingSpot.Fisherman
  alias FishingSpot.FishSpecies
  alias FishingSpot.FlyType

  use Ecto.Schema

  schema "fish_landed" do
    field(:date_and_time, :naive_datetime)
    field(:weight, :decimal)
    field(:length, :decimal)
    timestamps()

    belongs_to(:fisherman, Fisherman)
    belongs_to(:location, Location)
    belongs_to(:fly_type, FlyType)
    belongs_to(:fish_species, FishSpecies)
  end
end

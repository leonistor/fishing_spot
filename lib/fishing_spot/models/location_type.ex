defmodule FishingSpot.LocationType do
  use Ecto.Schema

  schema "location_types" do
    field(:name, :string)
    timestamps()
  end
end

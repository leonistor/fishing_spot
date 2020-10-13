defmodule FishingSpot.Location do
  alias FishingSpot.LocationType
  use Ecto.Schema

  schema "locations" do
    field(:name, :string)
    field(:lat, :decimal)
    field(:long, :decimal)
    field(:altitude, :integer)
    timestamps()

    belongs_to(:location_type, LocationType)
  end
end

defmodule FishingSpot.LocationTrip do
  alias FishingSpot.Location
  alias FishingSpot.Trip
  use Ecto.Schema

  schema "locations_trips" do
    timestamps()

    belongs_to(:location, Location)
    belongs_to(:trip, Trip)
  end
end

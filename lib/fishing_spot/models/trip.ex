defmodule FishingSpot.Trip do
  alias FishingSpot.LocationTrip
  use Ecto.Schema

  schema "trips" do
    field(:start_date, :date)
    field(:end_date, :date)
    timestamps()

    has_many(:locations_trips, LocationTrip)
    has_many(:locations, through: [:locations_trips, :location])
  end
end

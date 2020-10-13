defmodule FishingSpot.Fisherman do
  use Ecto.Schema
  alias FishingSpot.FishermanTrip
  alias FishingSpot.FishLanded

  schema "fishermen" do
    field(:name, :string)
    field(:date_of_birth, :date)
    timestamps()

    has_many(:fishermen_trips, FishermanTrip)
    has_many(:trips, through: [:fishermen_trips, :trip])
    has_many(:fish_landed, FishLanded)
  end
end

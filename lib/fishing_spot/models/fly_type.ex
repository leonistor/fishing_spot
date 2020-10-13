defmodule FishingSpot.FlyType do
  use Ecto.Schema

  schema "fly_types" do
    field(:name, :string)
    timestamps()
  end
end

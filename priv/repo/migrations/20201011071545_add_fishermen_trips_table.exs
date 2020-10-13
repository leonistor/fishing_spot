defmodule FishingSpot.Repo.Migrations.AddFishermenTripsTable do
  use Ecto.Migration

  def change do
    create table(:fishermen_trips) do
      add(:fisherman_id, references(:fishermen))
      add(:trip_id, references(:trips))

      timestamps()
    end
  end
end

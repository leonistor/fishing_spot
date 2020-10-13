alias FishingSpot.{
  Repo,
  Location,
  LocationTrip,
  LocationType,
  Fisherman,
  FishermanTrip,
  FishLanded,
  FishSpecies,
  FlyType,
  Trip
}

import Ecto.Query

q = fn -> c("lib/queries.exs") end
